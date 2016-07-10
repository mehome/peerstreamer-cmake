cmake_minimum_required(VERSION 3.0.2)

include(ExternalProject)

project(peerstreamer-openwrt)

#ExternalProject_Add(pjsip
#  PREFIX pjsip
#  URL http://www.pjsip.org/release/2.5.1/pjproject-2.5.1.tar.bz2
#  CONFIGURE_COMMAND ./configure --disable-sound --disable-oss --disable-video --disable-small-filter --disable-large-filter --disable-speex-aec --disable-g711-codec --disable-l16-codec --disable-gsm-codec --disable-g722-codec --disable-g7221-codec --disable-speex-codec --disable-ilbc-codec --disable-sdl --disable-ffmpeg --disable-v4l2 --disable-ssl --disable-opencore-amr --disable-silk --prefix=${CMAKE_BINARY_DIR}/pjsip/install
#  BUILD_COMMAND make dep && make
#  INSTALL_COMMAND make install
#  BUILD_IN_SOURCE 1
#)

include(grapes.cmake)
include(streamer.cmake)
