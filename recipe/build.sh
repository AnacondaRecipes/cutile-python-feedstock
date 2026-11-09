#!/bin/bash
set -exuo pipefail

# Anaconda: the GitHub tag tarball ships a placeholder VERSION (9.9.99); stamp the
# real version so the installed dist-info metadata matches the conda package.
"${PYTHON}" -c "open('src/cuda/tile/VERSION', 'w').write('${PKG_VERSION}')"

# Point CMake to the CUDA toolkit headers
if [[ "${target_platform}" == "linux-64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/x86_64-linux"
elif [[ "${target_platform}" == "linux-aarch64" ]]; then
    export CUDAToolkit_ROOT="${PREFIX}/targets/sbsa-linux"
fi

# Use conda-provided dlpack headers
export CUDA_TILE_CMAKE_DLPACK_PATH="${PREFIX}"

# Anaconda: XLA FFI headers are vendored as a second source (see meta.yaml)
# instead of being downloaded by CMake during configure.
export CUDA_TILE_CMAKE_XLA_PATH="${SRC_DIR}/xla"

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
