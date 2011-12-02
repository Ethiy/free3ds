# Lib3DS Root CMakeLists.txt
# author: Bruno VALLET
# date: 23/10/2009
# Manages Lib3DS project

cmake_minimum_required(VERSION 2.6)
# cmake 2.8 raises warnings when variables with names starting with numbers come in an if() statement
# as we have a 3dsplay executable, the warning is raised by if(3dsplay_SOMETHING)
# In general, I STRONGLY recommand NOT using variable names starting with numbers in cmake
#cmake_policy(SET CMP0012 OLD)

# PROJECT NAME AND TYPE.
project(Lib3DS C CXX)

set(PACKAGE "Lib3DS")
set(PACKAGE_NAME "3DS Library v1.7")
set(PACKAGE_STRING ".3ds objects handling library")
set(PACKAGE_TARNAME "Lib3DS")
set(PACKAGE_VERSION "1.0")
set(VERSION "1.0")

find_path(MATIS_MACROS_ROOT NAMES MatisMacros.cmake
	PATHS . .. ../.. ../../..
	PATH_SUFFIXES cmake extern/cmake extern/trunk/cmake
)
if(NOT MATIS_MACROS_ROOT)
	message(FATAL_ERROR "Could not find MatisMacros.cmake, please define MATIS_MACROS_ROOT to the directory containing MatisMacros.cmake")
endif(NOT MATIS_MACROS_ROOT)
include(${MATIS_MACROS_ROOT}/MatisMacros.cmake)

__matis_extern_project()
