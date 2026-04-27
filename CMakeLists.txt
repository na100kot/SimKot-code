cmake_minimum_required(VERSION 3.10)
project(MusicSalonApp)

set(CMAKE_CXX_STANDARD 17)

include_directories(includes)

set(SOURCES 
    src/main.cpp 
    src/app.cpp
)

add_executable(MusicSalonApp ${SOURCES})

set_target_properties(MusicSalonApp PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
