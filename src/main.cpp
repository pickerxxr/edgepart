#include <string>

#include "util.hpp"
#include "ne_partitioner.hpp"
#include "sne_partitioner.hpp"
#include "random_partitioner.hpp"
#include "hsfc_partitioner.hpp"
#include "dbh_partitioner.hpp"

DECLARE_bool(help);
DECLARE_bool(helpshort);

DEFINE_int32(p, 2, "number of parititions");
DEFINE_uint64(memsize, 4096, "memory size in megabytes");
DEFINE_string(filename, "", "the file name of the input graph");
DEFINE_string(filetype, "edgelist",
              "the type of input file (supports 'edgelist' and 'adjlist')");
DEFINE_bool(inmem, false, "in-memory mode");
DEFINE_double(sample_ratio, 2, "the sample size divided by num_vertices");
DEFINE_string(method, "sne",
              "partition method: ne, sne, random, and dbh");

int main(int argc, char *argv[])
{
    // std::string usage = "-filename <path to the input graph> "
    //                     "[-filetype <edgelist|adjlist>] "
    //                     "[-p <number of partitions>] "
    //                     "[-memsize <memory budget in MB>]";
    // google::SetUsageMessage(usage);
    // google::ParseCommandLineNonHelpFlags(&argc, &argv, true);
    // google::InitGoogleLogging(argv[0]);
    // FLAGS_logtostderr = 1; // output log to stderr
    // if (FLAGS_help) {
    //     FLAGS_help = false;
    //     FLAGS_helpshort = true;
    // }
    // google::HandleCommandLineHelpFlags();

    Timer timer;
    timer.start();

    Partitioner *partitioner = NULL;
    // if (FLAGS_method == "ne")
    //     partitioner = new NePartitioner("./../../../graph_data/com/com-orkut.ungraph.txt");
    // else if (FLAGS_method == "sne")
    //     partitioner = new SnePartitioner(FLAGS_filename);
    // else if (FLAGS_method == "random")
    //     partitioner = new RandomPartitioner(FLAGS_filename);
    // else if (FLAGS_method == "dbh")
    //     partitioner = new DbhPartitioner(FLAGS_filename);
    // else if (FLAGS_method == "hsfc")
    //     partitioner = new HsfcPartitioner(FLAGS_filename);
    // else
    //     LOG(ERROR) << "unkown method: " << FLAGS_method;
    LOG(INFO) << "partition method: " << "ne";
    partitioner = new NePartitioner("./../../../graph_data/com/com-orkut.ungraph.txt");
    partitioner->split();

    timer.stop();
    LOG(INFO) << "total time: " << timer.get_time();
    LOG(INFO) << "This is for debug";
}
