#include"../public/benchmark/benchmark.h"
#include<thread>
static void BM_SomeFunction(benchmark::State& state) {
  // Perform setup here
    for (auto _ : state) {
        // This code gets timed
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}
BENCHMARK(BM_SomeFunction);
    // Run the benchmark
BENCHMARK_MAIN();