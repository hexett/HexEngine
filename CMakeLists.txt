cmake_minimum_required(VERSION 3.20)

project(HexEngineRoot LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ---------------------------------------------------------
# CPM Package Manager (header-only, recommended)
# ---------------------------------------------------------
include(cmake/CPM.cmake)

# Make projects visible
add_subdirectory(HexEngine)
add_subdirectory(Sandbox)