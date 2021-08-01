#pragma once

#include <typeinfo>

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <random>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <unistd.h>

#include "util.hpp"
#include "min_heap.hpp"
#include "dense_bitset.hpp"
#include "edgepart.hpp"
#include "partitioner.hpp"
#include "graph.hpp"

/* Neighbor Expansion With Stop (NEWS) */
class NePartitioner : public Partitioner
{
  private:
    const double BALANCE_RATIO = 1.00;

    std::string basefilename;

    vid_t num_vertices;
    size_t num_edges, assigned_edges;
    int p, bucket;
    double average_degree;
    size_t capacity;
    // TODO: Capacity maybe the bound?

    std::vector<edge_t> edges;
    graph_t adj_out, adj_in;
    MinHeap<vid_t, vid_t> min_heap;
    std::vector<size_t> occupied;
    std::vector<vid_t> degrees;
    std::vector<int8_t> master;
    std::vector<dense_bitset> is_cores, is_boundarys;

    std::random_device rd;
    std::mt19937 gen;
    std::uniform_int_distribution<vid_t> dis;

    edgepart_writer<vid_t, uint16_t> writer;

    int check_edge(const edge_t *e)
    {
        rep (i, bucket) {
            auto &is_boundary = is_boundarys[i];
            if (is_boundary.get(e->first) && is_boundary.get(e->second) &&
                occupied[i] < capacity) {
                // TODO: capacity means upper bound and occupied[i] means the i_th partitioned edges number now
                // SO here we need to ban the capacity number
                // LOG(INFO) << "check_edge function called..." << i;
                return i;
            }
        }

        rep (i, bucket) {
            auto &is_core = is_cores[i], &is_boundary = is_boundarys[i];
            if ((is_core.get(e->first) || is_core.get(e->second)) &&
                occupied[i] < capacity) {
                if (is_core.get(e->first) && degrees[e->second] > average_degree)
                    continue;
                if (is_core.get(e->second) && degrees[e->first] > average_degree)
                    continue;
                is_boundary.set_bit(e->first);
                is_boundary.set_bit(e->second);
                // LOG(INFO) << "check_edge function called..." << i;
                return i;
            }
        }
        // LOG(INFO) << "The # of replication buckets: " << p;
        return p;
    }

    void assign_edge(int bucket, vid_t from, vid_t to)
    {
        writer.save_edge(from, to, bucket);
        assigned_edges++;
        occupied[bucket]++;
        degrees[from]--;
        degrees[to]--;
    }

    void add_boundary(vid_t vid)
    {
        auto &is_core = is_cores[bucket], &is_boundary = is_boundarys[bucket];

        if (is_boundary.get(vid))
            return;
        is_boundary.set_bit_unsync(vid);

        if (!is_core.get(vid)) {
            min_heap.insert(adj_out[vid].size() + adj_in[vid].size(), vid);
        }

        rep (direction, 2) {
            adjlist_t &neighbors = direction ? adj_out[vid] : adj_in[vid];
            for (size_t i = 0; i < neighbors.size();) {
                if (edges[neighbors[i].v].valid()) {
                    vid_t &u = direction ? edges[neighbors[i].v].second : edges[neighbors[i].v].first;
                    if (is_core.get(u)) {
                        // When core has adjacent vertex, i.e. when 
                        // there is no need to change this condition
                        assign_edge(bucket, direction ? vid : u,
                                    direction ? u : vid);
                        min_heap.decrease_key(vid);
                        edges[neighbors[i].v].remove();
                        std::swap(neighbors[i], neighbors.back());
                        neighbors.pop_back();
                    } else if (is_boundary.get(u) && 
                               occupied[bucket] < capacity) {
                        /* 
                        When secondary has adjacent vertex：
                         TODO we need to add stop condition here
                         the stop condition:
                         TODO： So now we need to find following data structure and objects：
                         (# edges -- in all adjacent vertices of secondary / # vertices -- in adj of vertices in secondary)  / # vertices -- in secondary
                            1. adjacent list of vertcies in secondary set;
                            2. how count the # of all connected edges of vertices in secondary
                            3. size of secondary set
                            4. and how to generate a new round 
                                (1) random select
                                (2) random select under a upper bound (adjacent size)
                        */
                        int num_ouside = 0;
                        for (auto iter = is_boundary.begin(); iter != is_boundary.end(); iter++){
                            // LOG(INFO) << *iter << " ";
                            int adj_num_outside = 0;
                            // total_size = 
                            num_ouside += 1;
                            // need to finish tomorrow: 
                            // step 1. 找到如何来访问来访问邻接表:

                        }

                        // the is_boundary is a pointer of pointer
                        // LOG(INFO) << "!!!!!!!is_boundary";
                        // LOG(INFO) << *typeid(neighbors[*is_boundary.begin()]).name();
                        double theta = 1.0;
                        // we add the stop condition
                            // if ((double)(theta) / is_boundary.size() > 100.0){
                                assign_edge(bucket, direction ? vid : u,
                                            direction ? u : vid);
                                min_heap.decrease_key(vid);
                                min_heap.decrease_key(u);

                                edges[neighbors[i].v].remove();
                                std::swap(neighbors[i], neighbors.back());
                                neighbors.pop_back();
                            // }
                            // else{
                            //     continue;
                            // }
                        } else
                            i++;
                } else {
                    std::swap(neighbors[i], neighbors.back());
                    neighbors.pop_back();
                }
            }
        }
    }

    void occupy_vertex(vid_t vid, vid_t d)
    {
        CHECK(!is_cores[bucket].get(vid)) << "add " << vid << " to core again";
        is_cores[bucket].set_bit_unsync(vid);

        if (d == 0)
            return;

        add_boundary(vid);

        for (auto &i : adj_out[vid])
            if (edges[i.v].valid())
                add_boundary(edges[i.v].second);
        adj_out[vid].clear();

        for (auto &i : adj_in[vid])
            if (edges[i.v].valid())
                add_boundary(edges[i.v].first);
        adj_in[vid].clear();
    }

    bool get_free_vertex(vid_t &vid)
    {
        vid = dis(gen);
        vid_t count = 0;
        while (count < num_vertices &&
               (adj_out[vid].size() + adj_in[vid].size() == 0 ||
                adj_out[vid].size() + adj_in[vid].size() >
                    2 * average_degree ||
                is_cores[bucket].get(vid))) {
            vid = (vid + ++count) % num_vertices;
        }
        if (count == num_vertices)
            return false;
        return true;
    }

    void assign_remaining();
    void assign_master();
    size_t count_mirrors();

  public:
    NePartitioner(std::string basefilename);
    void split();
};
