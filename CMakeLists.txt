cmake_minimum_required(VERSION 3.20)

project(avltree
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_C_FLAGS "-O3 -Wall -Wextra -pedantic")

add_library(pid
    STATIC
    lib/pid.cc
)

add_executable(app
    app/app.cc
)

target_include_directories(app
    PUBLIC lib
)

target_link_libraries(app
    PRIVATE pid
)
