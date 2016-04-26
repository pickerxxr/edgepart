#pragma once

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <random>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <unistd.h>

#include <boost/dynamic_bitset.hpp>

#include "util.hpp"
#include "min_heap.hpp"

class adjlist_t
{
  private:
    vid_t *start;
    vid_t len;

  public:
    adjlist_t() : start(NULL), len(0) {}
    adjlist_t(vid_t *start, vid_t len) : start(start), len(len) {}
    vid_t *begin() { return start; }
    vid_t *end() { return start + len; }
    void increment() { len++; }
    size_t size() const { return len; }
    vid_t &operator[](size_t idx) { return start[idx]; };
    const vid_t &operator[](size_t idx) const { return start[idx]; };
    vid_t &back() { return start[len - 1]; };
    const vid_t &back() const { return start[len - 1]; };
    void pop_back() { len--; }
    void clear() { len = 0; }
};

class graph_t
{
  private:
    vid_t num_vertices;
    std::vector<vid_t> neighbors;
    std::vector<adjlist_t> vdata;

  public:
    void resize(vid_t _num_vertices)
    {
        num_vertices = _num_vertices;
        vdata.resize(num_vertices);
    }

    size_t num_edges() const { return neighbors.size(); }

    void build(std::vector<edge_t> &edges)
    {
        repv (v, num_vertices)
            vdata[v].clear();
        std::sort(edges.begin(), edges.end(),
                  [](const edge_t &a, const edge_t &b) {
                      return a.first < b.first;
                  });
        neighbors.resize(edges.size());
        vid_t last_v = -1;
        vid_t *start_ptr = &neighbors[0];
        for (size_t i = 0; i < edges.size(); i++) {
            neighbors[i] = edges[i].second;
            if (edges[i].first == last_v) {
                vdata[last_v].increment();
            } else {
                vdata[edges[i].first] = adjlist_t(start_ptr + i, 1);
                last_v = edges[i].first;
            }
        }
    }

    void build_reverse(std::vector<edge_t> &edges)
    {
        repv (v, num_vertices)
            vdata[v].clear();
        std::sort(edges.begin(), edges.end(),
                  [](const edge_t &a, const edge_t &b) {
                      return a.second < b.second;
                  });
        neighbors.resize(edges.size());
        vid_t last_v = -1;
        vid_t *start_ptr = &neighbors[0];
        for (size_t i = 0; i < edges.size(); i++) {
            neighbors[i] = edges[i].first;
            if (edges[i].second == last_v) {
                vdata[last_v].increment();
            } else {
                vdata[edges[i].second] = adjlist_t(start_ptr + i, 1);
                last_v = edges[i].second;
            }
        }
    }

    adjlist_t &operator[](size_t idx) { return vdata[idx]; };
    const adjlist_t &operator[](size_t idx) const { return vdata[idx]; };
};

class NeighborPartitioner
{
  private:
    std::string basefilename;

    vid_t num_vertices;
    size_t num_edges, assigned_edges;
    int p, bucket;
    double average_degree, local_average_degree;
    size_t max_sample_size;
    size_t capacity, local_capacity;

    // use mmap for file input
    int fin;
    off_t filesize;
    char *fin_map, *fin_ptr, *fin_end;

    std::vector<edge_t> sample_edges;
    graph_t adj_out, adj_in;
    MinHeap<vid_t, vid_t> min_heap;
    std::vector<size_t> occupied;
    std::vector<vid_t> degrees;
    std::vector<int> master;
    std::vector<boost::dynamic_bitset<>> is_cores, is_boundarys;

    std::random_device rd;
    std::mt19937 gen;
    std::uniform_int_distribution<vid_t> dis;

    bool check_edge(const edge_t *e)
    {
        rep (i, bucket) {
            auto &is_boundary = is_boundarys[i];
            if (is_boundary[e->first] && is_boundary[e->second] &&
                occupied[i] < capacity) {
                assign_edge(i, e->first, e->second);
                return false;
            }
        }

        rep (i, bucket) {
            auto &is_core = is_cores[i], &is_boundary = is_boundarys[i];
            if ((is_core[e->first] || is_core[e->second]) &&
                occupied[i] < capacity) {
                if (is_core[e->first] && degrees[e->second] > average_degree)
                    continue;
                if (is_core[e->second] && degrees[e->first] > average_degree)
                    continue;
                is_boundary[e->first] = true;
                is_boundary[e->second] = true;
                assign_edge(i, e->first, e->second);
                return false;
            }
        }

        return true;
    }

    void assign_edge(int bucket, vid_t from, vid_t to)
    {
        assigned_edges++;
        occupied[bucket]++;
        degrees[from]--;
        degrees[to]--;
    }

    void erase_one(adjlist_t &neighbors, const vid_t &v)
    {
        for (size_t i = 0; i < neighbors.size(); )
            if (neighbors[i] == v) {
                std::swap(neighbors[i], neighbors.back());
                neighbors.pop_back();
                return;
            } else
                i++;
        LOG(FATAL) << "reverse edge not found";
    }

    size_t erase(adjlist_t &neighbors, const vid_t &v)
    {
        size_t count = 0;
        for (size_t i = 0; i < neighbors.size(); )
            if (neighbors[i] == v) {
                std::swap(neighbors[i], neighbors.back());
                neighbors.pop_back();
                count++;
            } else
                i++;
        return count;
    }

    void add_boundary(vid_t vid)
    {
        auto &is_core = is_cores[bucket], &is_boundary = is_boundarys[bucket];

        if (is_boundary[vid])
            return;
        is_boundary[vid] = true;

        if (!is_core[vid]) {
            min_heap.insert(adj_out[vid].size() + adj_in[vid].size(), vid);
        }

        rep (direction, 2) {
            adjlist_t &neighbors = direction ? adj_out[vid] : adj_in[vid];
            graph_t &adj_r = direction ? adj_in : adj_out;
            for (size_t i = 0; i < neighbors.size();) {
                vid_t &u = neighbors[i];
                if (is_core[u]) {
                    assign_edge(bucket, direction ? vid : u, direction ? u : vid);
                    min_heap.decrease_key(vid);
                    std::swap(u, neighbors.back());
                    neighbors.pop_back();
                } else if (is_boundary[u] && occupied[bucket] < local_capacity) {
                    assign_edge(bucket, direction ? vid : u, direction ? u : vid);
                    min_heap.decrease_key(vid);
                    erase_one(adj_r[u], vid);
                    min_heap.decrease_key(u);
                    std::swap(u, neighbors.back());
                    neighbors.pop_back();
                } else
                    i++;
            }
        }
    }

    void occupy_vertex(vid_t vid, vid_t d)
    {
        CHECK(!is_cores[bucket][vid]) << "add " << vid << " to core again";
        is_cores[bucket][vid] = true;

        if (d == 0)
            return;

        add_boundary(vid);

        for (auto &w : adj_out[vid])
            add_boundary(w);
        adj_out[vid].clear();

        for (auto &w : adj_in[vid])
            add_boundary(w);
        adj_in[vid].clear();
    }

    bool get_free_vertex(vid_t &vid)
    {
        vid = dis(gen);
        vid_t count = 0;
        while (count < num_vertices &&
               (adj_out[vid].size() + adj_in[vid].size() == 0 ||
                adj_out[vid].size() + adj_in[vid].size() >
                    2 * local_average_degree ||
                is_cores[bucket][vid])) {
            vid = (vid + ++count) % num_vertices;
        }
        if (count == num_vertices)
            return false;
        return true;
    }

    void read_more();
    void read_remaining();
    void clean_samples();
    void assign_master();
    size_t count_mirrors();

  public:
    NeighborPartitioner(std::string basefilename);
    void split();
};
