# adds LIB3DS executable targets
# author: Bruno VALLET
# date: 23/10/2009

# define source and header files and directories
set(3dsplay_FULL_SRCS ${Lib3DS_ROOT_DIR}/examples/3dsplay.c)
set(3dsdump_FULL_SRCS ${Lib3DS_ROOT_DIR}/tools/3dsdump.c)

include_directories(${Lib3DS_ROOT_DIR})
set(3dsplay_FULL_HEADERS "")
set(3dsdump_FULL_HEADERS "")

# set definitions and dependencies
set(3dsplay_DEFINITIONS "")
set(3dsdump_DEFINITIONS "")
set(3dsplay_DEPENDENCIES lib3ds GLUT)
set(3dsdump_DEPENDENCIES lib3ds)

FIND_PACKAGE(OpenGL REQUIRED)
message(STATUS {OPENGL_LIBRARIES}=${OPENGL_LIBRARIES})

__add_executable (3dsplay 3dsplay_FULL_SRCS 3dsplay_FULL_HEADERS 3dsplay_DEFINITIONS 3dsplay_DEPENDENCIES)
target_link_libraries(3dsplay ${OPENGL_LIBRARIES})
__add_executable (3dsdump 3dsdump_FULL_SRCS 3dsdump_FULL_HEADERS 3dsdump_DEFINITIONS 3dsdump_DEPENDENCIES)
