cmake_minimum_required(VERSION 2.8.0)
project(swig-matlab-pod)

include(ExternalProject)

ExternalProject_Add(swig-matlab
    GIT_REPOSITORY https://github.com/jaeandersson/swig
    GIT_TAG 3586dbf18c4d407b8321e0dafd24335002e28dc1
    DOWNLOAD_DIR ${PROJECT_SOURCE_DIR}/swig-matlab
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/swig-matlab
    PATCH_COMMAND ${PROJECT_SOURCE_DIR}/swig-matlab/autogen.sh
    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/swig-matlab/configure --prefix=${CMAKE_INSTALL_PREFIX} --with-matlab
    BUILD_COMMAND make
    INSTALL_COMMAND (make install || true) # on OSX, make install fails because yodl2man is missing. Installing it is a huge pain, but, fortunately, all the necessary files get installed before the yodl2man error. So we just try to install and hope for the best. 
    )
