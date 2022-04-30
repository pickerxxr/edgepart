#include "ne_partitioner.hpp"
#include "conversions.hpp"

NePartitioner::NePartitioner(std::string basefilename)
    : basefilename(basefilename), rd(), gen(rd()), writer(basefilename)
{
    Timer convert_timer;
    convert_timer.start();
    Converter *converter = new Converter(basefilename);
    convert(basefilename, converter);
    delete converter;
    convert_timer.stop();
    std::cout << "convert time: " << convert_timer.get_time();

    total_time.start();
    std::cout << "initializing partitioner";

    std::ifstream fin(binedgelist_name(basefilename),
                      std::ios::binary | std::ios::ate);
    auto filesize = fin.tellg();
    std::cout << "file size: " << filesize;
    fin.seekg(0, std::ios::beg);

    fin.read((char *)&num_vertices, sizeof(num_vertices));
    fin.read((char *)&num_edges, sizeof(num_edges));

    std::cout << "num_vertices: " << num_vertices
              << ", num_edges: " << num_edges;
//    CHECK_EQ(sizeof(vid_t) + sizeof(size_t) + num_edges * sizeof(edge_t), filesize);

    p = 10;
    expand_ratio = 3;
    average_degree = (double)num_edges * 2 / num_vertices;
    min_break_degree = 20;

    assigned_edges = 0;
    capacity = (double)num_edges * BALANCE_RATIO / p + 1;
    occupied.assign(p, 0);
    adj_out.resize(num_vertices);
    adj_in.resize(num_vertices);
    is_cores.assign(p, dense_bitset(num_vertices));
    is_boundarys.assign(p, dense_bitset(num_vertices));
    master.assign(num_vertices, -1);
    dis.param(std::uniform_int_distribution<vid_t>::param_type(0, num_vertices - 1));

    Timer read_timer;
    read_timer.start();
    std::cout << "loading..." << std::endl;
    edges.resize(num_edges);
    fin.read((char *)&edges[0], sizeof(edge_t) * num_edges);

    std::cout << "constructing..." << std::endl;
    adj_out.build(edges);
    adj_in.build_reverse(edges);

    degrees.resize(num_vertices);
    std::ifstream degree_file(degree_name(basefilename), std::ios::binary);
    degree_file.read((char *)&degrees[0], num_vertices * sizeof(vid_t));
    degree_file.close();
    read_timer.stop();
    std::cout << "time used for graph input and construction: " << read_timer.get_time() << std::endl;
};

void NePartitioner::assign_remaining()
{
    auto &is_boundary = is_boundarys[p - 1], &is_core = is_cores[p - 1];
    repv (u, num_vertices)
        for (auto &i : adj_out[u])
            if (edges[i.v].valid()) {
                assign_edge(p - 1, u, edges[i.v].second);
                is_boundary.set_bit_unsync(u);
                is_boundary.set_bit_unsync(edges[i.v].second);
            }

    repv (i, num_vertices) {
        if (is_boundary.get(i)) {
            is_core.set_bit_unsync(i);
            rep (j, p - 1)
                if (is_cores[j].get(i)) {
                    is_core.set_unsync(i, false);
                    break;
                }
        }
    }
}

void NePartitioner::assign_master()
{
    std::vector<vid_t> count_master(p, 0);
    std::vector<vid_t> quota(p, num_vertices);
    long long sum = p * num_vertices;
    std::uniform_real_distribution<double> distribution(0.0, 1.0);
    std::vector<dense_bitset::iterator> pos(p);
    rep (b, p)
        pos[b] = is_boundarys[b].begin();
    vid_t count = 0;
    while (count < num_vertices) {
        long long r = distribution(gen) * sum;
        int k;
        for (k = 0; k < p; k++) {
            if (r < quota[k])
                break;
            r -= quota[k];
        }
        while (pos[k] != is_boundarys[k].end() && master[*pos[k]] != -1)
            pos[k]++;
        if (pos[k] != is_boundarys[k].end()) {
            count++;
            master[*pos[k]] = k;
            writer.save_vertex(*pos[k], k);
            count_master[k]++;
            quota[k]--;
            sum--;
        }
    }
    int max_masters =
        *std::max_element(count_master.begin(), count_master.end());
    std::cout << "master balance: "
    << (double)max_masters / ((double)num_vertices / p) << std::endl;
}

size_t NePartitioner::count_mirrors()
{
    size_t result = 0;
    rep (i, p)
        result += is_boundarys[i].popcount();
    return result;
}

// main algorithm part
void NePartitioner::split()
{
    std::cout << "partitioning '" << basefilename << "'" << std::endl;
    std::cout << "(upper bound of ) number of partitions: " << p * expand_ratio << std::endl;

    Timer compute_timer;

    min_heap.reserve(num_vertices);

    std::cout << "partitioning..." << std::endl;
    compute_timer.start();
    bucket = 0;
//    while (bucket < p - 1) {
    while (bucket < p - 1) {
        std::cerr << bucket << ", ";
        std::cout << "sample size: " << adj_out.num_edges() << std::endl;
        /* TODO: CHECK the minimum degree of all the vertices */
        while ( occupied[bucket] < capacity) {
            vid_t d, vid;
            if (!min_heap.get_min(d, vid)) {
                if (!get_free_vertex(vid)) {
                    std::cout << "partition " << bucket
                    << " stop: no free vertices" << std::endl;
                    break;
                }
                d = adj_out[vid].size() + adj_in[vid].size();
            } else {
                // if the minimum degree is larger than the threshold, break.
                if (d > min_break_degree) {
                    // finish this partition & select a new starter
                    if (!get_free_vertex(vid)) {
                        std::cout << "partition " << bucket
                        << " stop: no free vertices" << std::endl;
                        break;
                    } else {
                        d = adj_out[vid].size() + adj_in[vid].size();
                        min_heap.clear();
                        bucket ++;
                        std::cerr << bucket << ", " ;
                    }
                } else {
                    min_heap.remove(vid);
                }
                /* CHECK_EQ(d, adj_out[vid].size() + adj_in[vid].size()); */
            }

            occupy_vertex(vid, d);
        }
        min_heap.clear();

        // keep the boundary correct
        rep (direction, 2)
            repv (vid, num_vertices) {
                adjlist_t &neighbors = direction ? adj_out[vid] : adj_in[vid];
                for (size_t i = 0; i < neighbors.size();) {
                    if (edges[neighbors[i].v].valid()) {
                        i++;
                    } else {
                        std::swap(neighbors[i], neighbors.back());
                        neighbors.pop_back();
                    }
                }
            }
        bucket ++;
    }
//    bucket = p - 1;
    bucket = 2 * p - 1;
    std::cerr << bucket << std::endl;
    assign_remaining();
    assign_master();
    compute_timer.stop();
    std::cout << "Assigned # edges: " << assigned_edges << std::endl;
    std::cout << "Total # edges: " << num_edges << std::endl;
    std::cout << "expected edges in each partition: " << num_edges / p << std::endl;
    rep (i, p)
    std::cout << "edges in partition " << i << ": " << occupied[i] << std::endl;
    size_t max_occupied = *std::max_element(occupied.begin(), occupied.end());
    std::cout << "balance: " << (double)max_occupied / ((double)num_edges / p) << std::endl;
    size_t total_mirrors = count_mirrors();
    std::cout << "total mirrors: " << total_mirrors << std::endl;
    std::cout << "replication factor: " << (double)total_mirrors / num_vertices << std::endl;
    std::cout << "time used for partitioning: " << compute_timer.get_time() << std::endl;

//    CHECK_EQ(assigned_edges, num_edges);

    total_time.stop();
    std::cout << "total partition time: " << total_time.get_time();
}
