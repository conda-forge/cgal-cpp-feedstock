cmake_minimum_required(VERSION 3.14)

# Based on minimal example in https://github.com/CGAL/cgal/wiki/How-to-use-CGAL-with-CMake-or-your-own-build-system
# but with Qt dependency removed

project(test_cgal)
find_package(CGAL REQUIRED COMPONENTS Core)

# Eigen3 was added to the test in order to ensure that FindEigen3.cmake from
# inside CGAL package is *not* being used, since this would be problematic.
# (`eigen` package comes with its own FindEigen3.cmake)
find_package(Eigen3 3.3 REQUIRED NO_MODULE)

add_executable(test_ test.cpp)
target_link_libraries(test_ CGAL::CGAL CGAL::CGAL_Core Eigen3::Eigen)
