cmake_minimum_required(VERSION 3.30.5)

set (CMAKE_C_COMPILER "/usr/bin/gcc")
set (CMAKE_CXX_COMPILER "/usr/bin/g++")

project(Hello-world)

add_executable(main main.cpp)

# cmake CMakeLists.txt -G "MinGW Makefiles"
