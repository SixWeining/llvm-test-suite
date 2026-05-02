#!/bin/bash

set -ex

# Note: The `clang`, `clang++` and `llvm-lit` used here are located in your LLVM build directory.

cmake -B _build \
      -G Ninja \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_FLAGS="-O3 -mlasx" \
      -DCMAKE_CXX_FLAGS="-O3 -mlasx" \
      -DTEST_SUITE_SUBDIRS="SingleSource"

cmake --build _build
llvm-lit _build/SingleSource/Benchmarks _build/SingleSource/UnitTests/Vectorizer _build/SingleSource/UnitTests/Vector
