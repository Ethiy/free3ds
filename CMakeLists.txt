cmake_minimum_required(VERSION 2.8)
project(Free3DS C CXX)

set(PACKAGE "Free3DS")
set(PACKAGE_NAME "3DS Library")
set(PACKAGE_STRING ".3ds format handling library")
set(PACKAGE_TARNAME "Free3DS")
set(CMAKE_MAJOR_VERSION "0")
set(CMAKE_MINOR_VERSION "1")
set(CMAKE_PATCH_VERSION "0")
set(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION})
set(PACKAGE_VERSION "${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}_1")

# Includes
include(cmake/compilers.cmake)

# Free3ds
file(GLOB_RECURSE Free3DS_SRCS "${Free3DS_SOURCE_DIR}/src/lib/*.c")
file(GLOB_RECURSE Free3DS_HEADER "${Free3DS_SOURCE_DIR}/src/lib/free3ds.h")

add_library(free3ds SHARED ${Free3DS_SRCS} ${Free3DS_HEADER})

if(CHECK_CXX_COMPILER_USED_TOOLS)
elseif("${CMAKE_CXX_COMPILER_ID}x" STREQUAL "MSVCx")
    # using Visual Studio C++
elseif("${CMAKE_CXX_COMPILER_ID}x" STREQUAL "Intelx")
    # using Intel C++
else()
    # GCC or Clang
    target_link_libraries(free3ds m)
endif(CHECK_CXX_COMPILER_USED_TOOLS)

# 3dsdump
set(3DSDUMP_SRC "${Free3DS_SOURCE_DIR}/src/cli/3dsdump.c")
add_executable(3dsdump ${3DSDUMP_SRC} ${Free3DS_HEADER})
target_link_libraries(3dsdump free3ds)

# Install libfree3ds
install(DIRECTORY src/lib/ DESTINATION include FILES_MATCHING PATTERN "*.h")
install(TARGETS free3ds EXPORT free3ds DESTINATION lib)
install(EXPORT free3ds DESTINATION share)

# CPack installer
include(InstallRequiredSystemLibraries)
set(CPACK_RESSOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
set(PACK_PACKAGE_VERSION_MAJOR "${CMAKE_MAJOR_VERSION}")
set(PACK_PACKAGE_VERSION_MINOR "${CMAKE_MINOR_VERSION}")
set(PACK_PACKAGE_VERSION_PATCH "${CMAKE_PATCH_VERSION}")

include(CPack)

