find_package(PkgConfig)

pkg_search_module(PJPROJECT REQUIRED libpjproject)

file(GLOB cache_src grapes/src/Cache/*.c)
file(GLOB chunk_buffer_src grapes/src/ChunkBuffer/*.c)
file(GLOB chunk_id_set_src grapes/src/ChunkIDSet/*.c)
file(GLOB chunk_trading_src grapes/src/ChunkTrading/*.c)
file(GLOB cloud_support_src grapes/src/CloudSupport/*.c)
file(GLOB peer_sampler_src grapes/src/PeerSampler/*.c)
file(GLOB peer_set_src grapes/src/PeerSet/*.c)
file(GLOB scheduler_src grapes/src/Scheduler/*.c)
file(GLOB topology_manager_src grapes/src/TopologyManager/*.c)
file(GLOB utils_src grapes/src/Utils/*.c)

set(chunkiser_src grapes/src/Chunkiser/chunkiser_attrib.c
                  grapes/src/Chunkiser/input-stream-dumb.c
                  grapes/src/Chunkiser/input-stream-dummy.c
                  grapes/src/Chunkiser/input-stream-ts.c
                  grapes/src/Chunkiser/input-stream-udp.c
                  grapes/src/Chunkiser/input-stream.c
                  grapes/src/Chunkiser/output-stream-dummy.c
                  grapes/src/Chunkiser/output-stream-raw.c
                  grapes/src/Chunkiser/output-stream-udp.c
                  grapes/src/Chunkiser/output-stream.c
                  grapes/src/Chunkiser/input-stream-rtp.c
                  grapes/src/Chunkiser/output-stream-rtp.c
)

add_library(grapes ${cache_src} ${chunk_buffer_src} ${chunk_id_set_src}
                          ${chunkiser_src} ${chunk_trading_src}
                          ${peer_sampler_src} ${peer_set_src} ${scheduler_src}
                          ${topology_manager_src} ${cloud_support_src} ${utils_src}
                          grapes/src/grapes_config.c grapes/src/net_helper-udp.c)

target_link_libraries(grapes
  #${PJPROJECT_LIBRARIES}
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjsua2-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjsua-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjsip-ua-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjsip-simple-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjsip-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjmedia-codec-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjmedia-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjmedia-videodev-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjmedia-audiodev-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjmedia-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjnath-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpjlib-util-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libsrtp-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libresample-x86_64-unknown-linux-gnu.a
  # ${CMAKE_BINARY_DIR}/pjsip/install/lib/libpj-x86_64-unknown-linux-gnu.a
  # uuid
  # m
  # rt
  # pthread
  # opus
  # stdc++
  m
  rt
  pthread
  pj
  pjmedia
)
#target_include_directories(grapes PUBLIC grapes/include ${CMAKE_BINARY_DIR}/pjsip/install/include)
target_include_directories(grapes PUBLIC grapes/include ${PJPROJECT_INCLUDE_DIRS})
target_compile_options(grapes PUBLIC ${PJPROJECT_CFLAGS_OTHER})
set_target_properties(grapes PROPERTIES LINK_FLAGS "-L${PJPROJECT_LIBRARY_DIRS}")
#install(TARGETS grapes EXPORT libgrapes LIBRARY DESTINATION lib)
#install(EXPORT libgrapes DESTINATION lib/grapes)
#install(DIRECTORY include/ DESTINATION include/grapes)
