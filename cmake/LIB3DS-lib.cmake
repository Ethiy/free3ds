# adds LIB3DS library targets
# author: Bruno VALLET
# date: 23/10/2009

# define source and header files and directories
set(lib3ds_SRCS
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
__global_append(lib3ds_SRCS lib3ds_FULL_SRCS "${LIB3DS_ROOT_DIR}/lib3ds/")

include_directories(${LIB3DS_ROOT_DIR})
set(lib3ds_HEADERS
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
__global_append(lib3ds_HEADERS lib3ds_FULL_HEADERS "${LIB3DS_ROOT_DIR}/lib3ds/")

# set definitions and dependencies
set(lib3ds_DEFINITIONS "")
set(lib3ds_DEPENDENCIES "")


__add_library (lib3ds lib3ds_FULL_SRCS lib3ds_FULL_HEADERS lib3ds_DEFINITIONS lib3ds_DEPENDENCIES)
if(UNIX)
	set_target_properties(lib3ds PROPERTIES PREFIX "")
	set_target_properties(lib3ds PROPERTIES IMPORT_PREFIX "")
	target_link_libraries(lib3ds m)
endif(UNIX)

IF(WIN32 AND MSVC AND BUILD_SHARED_LIBS)
	SET_PROPERTY(TARGET lib3ds APPEND PROPERTY DEFINE_SYMBOL LIB3DS_EXPORTS)
ENDIF(WIN32 AND MSVC AND BUILD_SHARED_LIBS)


		
