# QuaZip_FOUND               - QuaZip library was found
# QuaZip_INCLUDE_DIR         - Path to QuaZip include dir
# QuaZip_INCLUDE_DIRS        - Path to QuaZip and zlib include dir (combined from QUAZIP_INCLUDE_DIR + ZLIB_INCLUDE_DIR)
# QuaZip_LIBRARIES           - List of QuaZip libraries
# QuaZip_ZLIB_INCLUDE_DIR    - The include dir of zlib headers


IF (QuaZip_INCLUDE_DIRS AND QuaZip_LIBRARIES)
	# in cache already
	SET(QuaZip_FOUND TRUE)
ELSE (QuaZip_INCLUDE_DIRS AND QuaZip_LIBRARIES)
	IF (WIN32)
		get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)
		FIND_LIBRARY(QuaZip_LIBRARIES
			NAMES libquazip quazip
			HINTS ${PACKAGE_PREFIX_DIR}
			PATH_SUFFIXES lib)
		FIND_PATH(QuaZip_INCLUDE_DIR
			NAMES quazip.h
			HINTS ${PACKAGE_PREFIX_DIR}
			PATH_SUFFIXES include/quazip)
		FIND_PATH(QuaZip_ZLIB_INCLUDE_DIR
			NAMES zlib.h)
	ELSE(WIN32)
		FIND_PACKAGE(PkgConfig)
		pkg_check_modules(PC_QUAZIP quazip)
		FIND_LIBRARY(QuaZip_LIBRARIES
			NAMES quazip
			HINTS /usr/lib /usr/lib64
		)
		FIND_PATH(QuaZip_INCLUDE_DIR quazip.h
			HINTS /usr/include /usr/local/include
            PATH_SUFFIXES quazip
		)
		FIND_PATH(QuaZip_ZLIB_INCLUDE_DIR zlib.h HINTS /usr/include /usr/local/include)
	ENDIF (WIN32)
	INCLUDE(FindPackageHandleStandardArgs)
	SET(QuaZip_INCLUDE_DIRS ${QuaZip_INCLUDE_DIR} ${QuaZip_ZLIB_INCLUDE_DIR})
	find_package_handle_standard_args(QuaZip DEFAULT_MSG  QuaZip_LIBRARIES QuaZip_INCLUDE_DIR QuaZip_ZLIB_INCLUDE_DIR QuaZip_INCLUDE_DIRS)
ENDIF (QuaZip_INCLUDE_DIRS AND QuaZip_LIBRARIES)
