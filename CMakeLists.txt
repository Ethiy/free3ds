cmake_minimum_required(VERSION 3.4)
project(Lib3DS C CXX)

set(PACKAGE "Lib3DS")
set(PACKAGE_NAME "3DS Library")
set(PACKAGE_STRING ".3ds format handling library")
set(PACKAGE_TARNAME "Lib3DS")
set(CMAKE_MAJOR_VERSION "3")
set(CMAKE_MINOR_VERSION "0")
set(CMAKE_PATCH_VERSION "0")
set(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION})
set(PACKAGE_VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION})

# Includes
include(cmake/compilers.cmake)
include(cmake/dependencies.cmake)

# Lib3ds
file(GLOB_RECURSE Lib3DS_SRCS "${Lib3DS_SOURCE_DIR}/src/lib/*.c")
file(GLOB_RECURSE Lib3DS_HEADERS "${Lib3DS_SOURCE_DIR}/src/lib/*.h")

add_library(3ds SHARED ${Lib3DS_SRCS} ${Lib3DS_HEADERS})

if(CHECK_CXX_COMPILER_USED_TOOLS)
elseif("${CMAKE_CXX_COMPILER_ID}x" STREQUAL "MSVCx")
    # using Visual Studio C++
    set_property(TARGET "Lib3DS" APPEND PROPERTY DEFINE_SYMBOL LIB3DS_EXPORTS)
elseif("${CMAKE_CXX_COMPILER_ID}x" STREQUAL "Intelx")
    # using Intel C++
else()
    # GCC or Clang
    target_link_libraries(3ds m)
endif(CHECK_CXX_COMPILER_USED_TOOLS)

# 3dsplay
set(3DSPLAY_SRC "${Lib3DS_SOURCE_DIR}/src/cli/3dsplay.c")

add_executable(3dsplay ${3DSPLAY_SRC} ${Lib3DS_HEADERS})
target_link_libraries(3dsplay ${LIBS} 3ds)

# 3dsdump
set(3DSDUMP_SRC "${Lib3DS_SOURCE_DIR}/src/cli/3dsdump.c")
add_executable(3dsdump ${3DSDUMP_SRC} ${Lib3DS_HEADERS})
target_link_libraries(3dsdump 3ds)
