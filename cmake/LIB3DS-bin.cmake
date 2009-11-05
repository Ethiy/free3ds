# adds LIB3DS executable targets
# author: Bruno VALLET
# date: 23/10/2009

# define source and header files and directories
SET(3dsplay_FULL_SRCS ${LIB3DS_ROOT_DIR}/examples/3dsplay.c)

include_directories(${LIB3DS_ROOT_DIR})
SET(3dsplay_FULL_HEADERS "")

# set definitions and dependencies
set(3dsplay_DEFINITIONS "")
if(WIN32)
	set(3dsplay_DEFINITIONS ${DEFINITIONS} -DLIB3DS_EXPORTS)
endif(WIN32)
find_package(GLUT REQUIRED)
set(3dsplay_DEPENDENCIES lib3ds GLUT)

__add_executable (3dsplay 3dsplay_FULL_SRCS 3dsplay_FULL_HEADERS 3dsplay_DEFINITIONS 3dsplay_DEPENDENCIES)
