mkdir build && cd build

set CMAKE_CONFIG="Release"

REM This is a workaround for a problem where MSBuild.exe is not found in Azure
REM See also https://github.com/conda-forge/conda-forge.github.io/issues/703
set CMAKE_GENERATOR=NMake Makefiles

cmake -LAH -G"%CMAKE_GENERATOR%" ^
  -DCMAKE_BUILD_TYPE="%CMAKE_CONFIG%" ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DWITH_CGAL_ImageIO=OFF ^
  -DWITH_CGAL_Qt5=OFF ^
  .. || goto :eof

cmake --build . --config %CMAKE_CONFIG% --target INSTALL || goto :eof
ctest --output-on-failure
