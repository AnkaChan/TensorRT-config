# TensorRT-config
The officially released TensorRT does not include a TensorRT-config.cmake file (at least not for the windows version). This is a custom version of TensorRT-config.cmake file that I wrote myself, hopefully this can be helpful to you.

## Usage:

- put TensorRT-config.cmake to the root folder of your TensorRT installation, i.e., the folder that contains bin, lib, include, .etc.
- Add a System environment variable "TensorRT_Dir", whose value is the directory of the folder caontains the TensorRT-config.cmake file.
- in you CMakelists.txt, call find_package(TensorRT)
- after calling find_package(TensorRT), Add those commands to your CMakelists.txt to link to TensorRT:

```cmake
include_directories(
  ${TENSORRT_INCLUDE_DIRS}
)
target_link_libraries(Your_Target ${TENSORRT_LIBRARIES})
```

## Compatibility
- this have been tested for TensorRT higher than 8.0. It is known that in the lower vertion of TensorRT the "lib" subdirectory can be named as "libs"

