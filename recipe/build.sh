#!/bin/bash
set -ex

# Point CMake to the CUDA toolkit headers
if [[ "${target_platform}" == "linux-64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/x86_64-linux"
elif [[ "${target_platform}" == "linux-aarch64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/sbsa-linux"
fi

# Use conda-provided dlpack headers
export CUDA_TILE_CMAKE_DLPACK_PATH="${PREFIX}"

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
