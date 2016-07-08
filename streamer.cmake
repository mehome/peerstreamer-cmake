set(src streamer/channel.c
  streamer/chunklock.c
  streamer/dbg.c
  #streamer/input-chunkstream.c
  #streamer/loop-mt.c
  #streamer/output-chunkstream.c
  streamer/output-grapes.c
  streamer/ratecontrol.c
  streamer/transition/node_addr.c
  streamer/chunk_signaling.c
  streamer/config-ALTO.c
  streamer/input-grapes.c
  streamer/int_bucket.c
  streamer/loop.c
  streamer/measures.c
  #streamer/mlmonl_adapter/config-ml.c
  #streamer/mlmonl_adapter/measures-monl.c
  #streamer/mlmonl_adapter/net_helper-ml.c
  streamer/net_helpers.c
  streamer/sparse_vector.c
  streamer/streamer.c
  streamer/streaming.c
  streamer/string_indexer.c
  #streamer/test/int_bucket_test.c
  #streamer/test/sparse_vector_test.c
  #streamer/test/string_indexer_test.c
  #streamer/test/xlweighter_test.c
  #streamer/topology-ALTO.c
  streamer/topology.c
  streamer/transaction.c
  streamer/xlweighter.c
)

add_executable(streamer ${src})
target_compile_definitions(streamer PUBLIC "-DOUTPUT_REORDER=true")
target_link_libraries(streamer grapes)
target_include_directories(streamer PUBLIC streamer/compatibility streamer/transition grapes/include include)
#set_target_properties(streamer PROPERTIES LINK_FLAGS "-static")
