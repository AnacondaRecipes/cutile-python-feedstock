#!/bin/bash
set -ex

# Point CMake to the CUDA toolkit headers
if [[ "${target_platform}" == "linux-64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/x86_64-linux"
elif [[ "${target_platform}" == "linux-aarch64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/sbsa-linux"
fi

# dlpack >=1.1 not available in pkgs/main; let CMake auto-fetch from GitHub

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
