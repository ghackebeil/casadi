FIND_PATH(MATLAB_INCLUDE_DIR 
extern/include/engine.h
HINTS $ENV{MATLAB}
)

# includes
IF (MATLAB_INCLUDE_DIR)
   SET(MATLAB_FOUND_INCLUDE TRUE)
   SET(MATLAB_INCLUDE_DIRS ${MATLAB_INCLUDE_DIR}/extern/include)
   MESSAGE(STATUS "Found MATLAB include dir: ${MATLAB_INCLUDE_DIRS}")
ELSE (MATLAB_INCLUDE_DIR)
   MESSAGE(STATUS "Could not find MATLAB include dir")
ENDIF (MATLAB_INCLUDE_DIR)

FIND_PATH(MATLAB_LIBS_DIR
libeng.so
HINTS $ENV{MATLAB}/bin/*
)

MESSAGE(STATUS "********************** ${MATLAB_LIBS_DIR} $ENV{MATLAB}/bin")

# libraries
SET(MATLAB_LIBS_LIST
	eng
	mx
)

SET(MATLAB_LIBRARIES )
FOREACH(LIB in ${MATLAB_LIBS_LIST})
  FIND_LIBRARY(MATLAB_LIB_${LIB}
    NAMES ${LIB}
    HINTS ${MATLAB_LIBS_DIR})
  IF(MATLAB_LIB_${LIB})
    #MESSAGE(STATUS "Found ${LIB}: ${MATLAB_LIB_${LIB}}")
    SET(MATLAB_LIBRARIES ${MATLAB_LIBRARIES} ${MATLAB_LIB_${LIB}})
  ELSE(MATLAB_LIB_${LIB})
    #MESSAGE(STATUS "Could not find lib ${MATLAB_LIB_${LIB}}")
  ENDIF(MATLAB_LIB_${LIB})
ENDFOREACH(LIB)

IF (MATLAB_LIBRARIES)
   SET(MATLAB_LIBRARIES ${MATLAB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${LAPACK_LIBRARIES} ${EXTRA_LIBRARIES} ${CMAKE_DL_LIBS})
   MESSAGE(STATUS "Found Matlab libs: ${MATLAB_LIBRARIES}")
   SET(MATLAB_FOUND_LIBS TRUE)
ELSE (MATLAB_LIBRARIES)
   MESSAGE(STATUS "Could not find Matlab libs")
ENDIF (MATLAB_LIBRARIES)


IF(MATLAB_FOUND_INCLUDE AND MATLAB_FOUND_LIBS)
  SET(MATLAB_FOUND TRUE)
ENDIF(MATLAB_FOUND_INCLUDE AND MATLAB_FOUND_LIBS)
