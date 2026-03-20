@echo on

set CUDAToolkit_ROOT=%LIBRARY_PREFIX%
set CUDA_TILE_CMAKE_DLPACK_PATH=%LIBRARY_PREFIX%
set Python_ROOT_DIR=%PREFIX%

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
