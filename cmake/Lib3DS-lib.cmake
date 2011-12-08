# adds LIB3DS library targets
# author: Bruno VALLET
# date: 23/10/2009

# define source and header files and directories
set(Lib3DS_SRCS
atmosphere.c
background.c
camera.c
chunk.c
ease.c
file.c
io.c
light.c
material.c
matrix.c
mesh.c
node.c
quat.c
shadow.c
tcb.c
tracks.c
vector.c
viewport.c
)
__global_append(Lib3DS_SRCS Lib3DS_FULL_SRCS "${Lib3DS_ROOT_DIR}/lib3ds/")

include_directories(${Lib3DS_ROOT_DIR})
set(Lib3DS_HEADERS
atmosphere.h
background.h
camera.h
chunk.h
chunktable.h
ease.h
file.h
io.h
light.h
material.h
matrix.h
mesh.h
node.h
quat.h
shadow.h
tcb.h
tracks.h
types.h
vector.h
viewport.h
)
__global_append(Lib3DS_HEADERS Lib3DS_FULL_HEADERS "${Lib3DS_ROOT_DIR}/lib3ds/")

# set definitions and dependencies
set(Lib3DS_DEFINITIONS "")
set(Lib3DS_DEPENDENCIES "")
set(Lib3DS_NAME "Lib3DS")
if(UNIX)
  set(Lib3DS_NAME "3DS")
endif(UNIX)

__add_library (${Lib3DS_NAME} Lib3DS_FULL_SRCS Lib3DS_FULL_HEADERS Lib3DS_DEFINITIONS Lib3DS_DEPENDENCIES)
if(UNIX)
	#set_target_properties(Lib3DS PROPERTIES PREFIX "")
	#set_target_properties(Lib3DS PROPERTIES IMPORT_PREFIX "")
	target_link_libraries(${Lib3DS_NAME} m)
endif(UNIX)

IF(WIN32 AND MSVC AND BUILD_SHARED_LIBS)
	SET_PROPERTY(TARGET ${Lib3DS_NAME} APPEND PROPERTY DEFINE_SYMBOL LIB3DS_EXPORTS)
ENDIF(WIN32 AND MSVC AND BUILD_SHARED_LIBS)


		
