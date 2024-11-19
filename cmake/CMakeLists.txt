cmake_minimum_required(VERSION 3.30.5)

set (CMAKE_C_COMPILER "/usr/bin/gcc")
set (CMAKE_CXX_COMPILER "/usr/bin/g++")

project(Project-1)

# cmake CMakeLists.txt -G "MinGW Makefiles"

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# 添加 src 目录中的所有 cpp 文件到项目中
file(GLOB_RECURSE SOURCES "${CMAKE_SOURCE_DIR}/src/*")
# 添加可执行文件并链接源文件
add_executable(main ${SOURCES})
