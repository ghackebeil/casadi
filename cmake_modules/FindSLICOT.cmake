# TRY TO FIND THE INCLUDE DIRECTORY
FIND_LIBRARY(SLICOT_LIB
slicot
PATHS $ENV{SLICOT_LIBRARY_DIR}
)

IF(NOT SLICOT_LIB)
  MESSAGE(STATUS "SLICOT: Cound not find library slicot. Try stetting SLICOT_LIBRARY_DIR env var.") 
ENDIF(NOT SLICOT_LIB)

IF(SLICOT_LIB)
  SET(SLICOT_LIBRARIES ${SLICOT_LIB})
  SET(SLICOT_FOUND TRUE)
ENDIF()


