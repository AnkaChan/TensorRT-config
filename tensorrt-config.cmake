#####################################
## tensorrt specific configuration ##
#####################################
set (TENSORRT_ROOT ${CMAKE_CURRENT_LIST_DIR})

#find_package(CUDA)
#find_library(NVINFER  NAMES nvinfer)
#find_library(NVINFERPLUGIN NAMES nvinfer_plugin)
#find_library(NVPARSERS NAMES nvparsers)
#find_library(NVONNXPARSER NAMES nvonnxparser)
#find_library(NVONNXPARSERRUNTIME NAMES nvonnxparser_runtime)

find_package(CUDA)
find_library(NVINFER  NAMES nvinfer PATHS ${TENSORRT_ROOT}/lib)
find_library(NVINFERPLUGIN NAMES nvinfer_plugin PATHS ${TENSORRT_ROOT}/lib)
find_library(NVPARSERS NAMES nvparsers PATHS ${TENSORRT_ROOT}/lib)
find_library(NVONNXPARSER NAMES nvonnxparser PATHS ${TENSORRT_ROOT}/lib)
#find_library(NVONNXPARSERRUNTIME NAMES nvonnxparser_runtime PATHS ${TENSORRT_ROOT}/lib)


# If it is ALL there, export libraries as a single package
#if(CUDA_FOUND AND NVINFER AND NVINFERPLUGIN AND NVPARSERS AND NVONNXPARSER AND NVONNXPARSERRUNTIME)
if(CUDA_FOUND AND NVINFER AND NVINFERPLUGIN AND NVPARSERS AND NVONNXPARSER)
  message("TensorRT available!")
  message("CUDA Libs: ${CUDA_LIBRARIES}")
  message("CUDA Headers: ${CUDA_INCLUDE_DIRS}")
  message("NVINFER: ${NVINFER}")
  message("NVINFERPLUGIN: ${NVINFERPLUGIN}")
  message("NVPARSERS: ${NVPARSERS}")
  message("NVONNXPARSER: ${NVONNXPARSER}")
  message("NVONNXPARSERRUNTIME: ${NVONNXPARSERRUNTIME}")
  #list(APPEND TENSORRT_LIBRARIES ${CUDA_LIBRARIES} nvinfer nvinfer_plugin nvparsers nvonnxparser nvonnxparser_runtime)
  list(APPEND TENSORRT_LIBRARIES ${CUDA_LIBRARIES} ${CUDA_cublas_LIBRARY} ${CUDA_npps_LIBRARY} ${CUDA_nppig_LIBRARY} ${NVINFER} ${NVINFERPLUGIN} ${NVPARSERS} ${NVONNXPARSER})
  message("All togheter now (libs): ${TENSORRT_LIBRARIES}")
  list(APPEND TENSORRT_INCLUDE_DIRS ${CUDA_INCLUDE_DIRS})
  list(APPEND TENSORRT_INCLUDE_DIRS ${TENSORRT_ROOT}/include )
  message("All togheter now (inc): ${TENSORRT_INCLUDE_DIRS}")
  set(TENSORRT_FOUND ON)
else()
  message("TensorRT NOT Available")
  set(TENSORRT_FOUND OFF)
endif()