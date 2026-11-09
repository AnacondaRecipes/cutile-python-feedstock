@echo on

:: Anaconda: the GitHub tag tarball ships a placeholder VERSION (9.9.99); stamp the
:: real version so the installed dist-info metadata matches the conda package.
%PYTHON% -c "open('src/cuda/tile/VERSION', 'w').write('%PKG_VERSION%')"
if errorlevel 1 exit 1

set CUDAToolkit_ROOT=%LIBRARY_PREFIX%
set CUDA_TILE_CMAKE_DLPACK_PATH=%LIBRARY_PREFIX%
:: Anaconda: XLA FFI headers are vendored as a second source (see meta.yaml)
:: instead of being downloaded by CMake during configure.
set CUDA_TILE_CMAKE_XLA_PATH=%SRC_DIR%\xla
set Python_ROOT_DIR=%PREFIX%

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
