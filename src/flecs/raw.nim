
type
  enum_ecs_inout_kind_t* {.size: sizeof(cuint).} = enum
    EcsInOutDefault = 0, EcsInOutNone = 1, EcsInOutFilter = 2, EcsInOut = 3,
    EcsIn = 4, EcsOut = 5
type
  enum_ecs_oper_kind_t* {.size: sizeof(cuint).} = enum
    EcsAnd = 0, EcsOr = 1, EcsNot = 2, EcsOptional = 3, EcsAndFrom = 4,
    EcsOrFrom = 5, EcsNotFrom = 6
type
  enum_ecs_query_cache_kind_t* {.size: sizeof(cuint).} = enum
    EcsQueryCacheDefault = 0, EcsQueryCacheAuto = 1, EcsQueryCacheAll = 2,
    EcsQueryCacheNone = 3
type
  enum_ecs_http_method_t* {.size: sizeof(cuint).} = enum
    EcsHttpGet = 0, EcsHttpPost = 1, EcsHttpPut = 2, EcsHttpDelete = 3,
    EcsHttpOptions = 4, EcsHttpMethodUnsupported = 5
type
  enum_ecs_type_kind_t* {.size: sizeof(cuint).} = enum
    EcsPrimitiveType = 0, EcsBitmaskType = 1, EcsEnumType = 2,
    EcsStructType = 3, EcsArrayType = 4, EcsVectorType = 5, EcsOpaqueType = 6
const
  EcsTypeKindLast* = enum_ecs_type_kind_t.EcsOpaqueType
type
  enum_ecs_primitive_kind_t* {.size: sizeof(cuint).} = enum
    EcsBool = 1, EcsChar = 2, EcsByte = 3, EcsU8 = 4, EcsU16 = 5, EcsU32 = 6,
    EcsU64 = 7, EcsI8 = 8, EcsI16 = 9, EcsI32 = 10, EcsI64 = 11, EcsF32 = 12,
    EcsF64 = 13, EcsUPtr = 14, EcsIPtr = 15, EcsString = 16, EcsEntity = 17,
    EcsId = 18
const
  EcsPrimitiveKindLast* = enum_ecs_primitive_kind_t.EcsId
type
  enum_ecs_meta_op_kind_t* {.size: sizeof(cuint).} = enum
    EcsOpPushStruct = 0, EcsOpPushArray = 1, EcsOpPushVector = 2, EcsOpPop = 3,
    EcsOpOpaqueStruct = 4, EcsOpOpaqueArray = 5, EcsOpOpaqueVector = 6,
    EcsOpForward = 7, EcsOpScope = 8, EcsOpOpaqueValue = 9, EcsOpEnum = 10,
    EcsOpBitmask = 11, EcsOpPrimitive = 12, EcsOpBool = 13, EcsOpChar = 14,
    EcsOpByte = 15, EcsOpU8 = 16, EcsOpU16 = 17, EcsOpU32 = 18, EcsOpU64 = 19,
    EcsOpI8 = 20, EcsOpI16 = 21, EcsOpI32 = 22, EcsOpI64 = 23, EcsOpF32 = 24,
    EcsOpF64 = 25, EcsOpUPtr = 26, EcsOpIPtr = 27, EcsOpString = 28,
    EcsOpEntity = 29, EcsOpId = 30
const
  EcsMetaTypeOpKindLast* = enum_ecs_meta_op_kind_t.EcsOpId
type
  struct_ecs_table_t* = object
type
  struct_ecs_query_cache_match_t* = object
type
  ECS_BITMASK_IMPL* = object
type
  struct_ecs_script_template_t* = object
type
  struct_ecs_script_runtime_t* = object
type
  struct_ecs_http_server_t* = object
type
  ecs_dbg_1* = object
type
  ecs_pair_second* = object
type
  compiler_clang_major_private* = object
type
  ecs_pair_first* = object
type
  struct_ecs_component_record_t* = object
type
  ECS_ENUM_IMPL* = object
type
  struct_ecs_query_op_t* = object
type
  struct_ecs_mixins_t* = object
type
  ECS_DECLARE* = object
type
  struct_ecs_world_t* = object
type
  struct_ecs_expr_node_t* = object
type
  struct_ecs_event_id_record_t* = object
type
  struct_ecs_query_cache_group_t* = object
type
  struct_ecs_data_t* = object
type
  struct_ecs_query_op_ctx_t* = object
type
  struct_ecs_query_var_t* = object
type
  ECS_STRUCT_IMPL* = object
type
  struct_ecs_stage_t* = object
type
  FLECS_API* = object
type
  ecs_flags8_t* = uint8      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:900:17
  ecs_flags16_t* = uint16    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:901:18
  ecs_flags32_t* = uint32    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:902:18
  ecs_flags64_t* = uint64    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:903:18
  ecs_size_t* = int32        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:920:17
  ecs_allocator_t* = struct_ecs_allocator_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:923:32
  struct_ecs_allocator_t* {.pure, inheritable, bycopy.} = object
    chunks*: ecs_block_allocator_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2978:8
    sizes*: struct_ecs_sparse_t
  ecs_id_t* = uint64         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1188:18
  ecs_entity_t* = ecs_id_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1195:18
  struct_ecs_type_t* {.pure, inheritable, bycopy.} = object
    array*: ptr ecs_id_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1212:9
    count*: int32
  ecs_type_t* = struct_ecs_type_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1215:3
  ecs_world_t* = struct_ecs_world_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1239:28
  ecs_stage_t* = struct_ecs_stage_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1242:28
  ecs_table_t* = struct_ecs_table_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1245:28
  ecs_term_t* = struct_ecs_term_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1248:27
  struct_ecs_term_t* {.pure, inheritable, bycopy.} = object
    id*: ecs_id_t            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4512:8
    src*: ecs_term_ref_t
    first*: ecs_term_ref_t
    second*: ecs_term_ref_t
    trav*: ecs_entity_t
    inout*: int16
    oper*: int16
    field_index*: int8
    flags_private*: ecs_flags16_t
  ecs_query_t* = struct_ecs_query_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1251:28
  struct_ecs_query_t* {.pure, inheritable, bycopy.} = object
    hdr*: ecs_header_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4536:8
    terms*: ptr ecs_term_t
    sizes*: ptr int32
    ids*: ptr ecs_id_t
    bloom_filter*: uint64
    flags*: ecs_flags32_t
    var_count*: int8
    term_count*: int8
    field_count*: int8
    fixed_fields*: ecs_flags32_t
    var_fields*: ecs_flags32_t
    static_id_fields*: ecs_flags32_t
    data_fields*: ecs_flags32_t
    write_fields*: ecs_flags32_t
    read_fields*: ecs_flags32_t
    row_fields*: ecs_flags32_t
    shared_readonly_fields*: ecs_flags32_t
    set_fields*: ecs_flags32_t
    cache_kind*: ecs_query_cache_kind_t
    vars*: ptr cstring
    ctx*: pointer
    binding_ctx*: pointer
    entity*: ecs_entity_t
    real_world*: ptr ecs_world_t
    world*: ptr ecs_world_t
    eval_count*: int32
  ecs_observer_t* = struct_ecs_observer_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1270:31
  struct_ecs_observer_t* {.pure, inheritable, bycopy.} = object
    hdr*: ecs_header_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4577:8
    query*: ptr ecs_query_t
    events*: array[8'i64, ecs_entity_t]
    event_count*: int32
    callback*: ecs_iter_action_t
    run*: ecs_run_action_t
    ctx*: pointer
    callback_ctx*: pointer
    run_ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    callback_ctx_free*: ecs_ctx_free_t
    run_ctx_free*: ecs_ctx_free_t
    observable*: ptr ecs_observable_t
    world*: ptr ecs_world_t
    entity*: ecs_entity_t
  ecs_observable_t* = struct_ecs_observable_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1275:33
  struct_ecs_observable_t* {.pure, inheritable, bycopy.} = object
    on_add*: ecs_event_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4772:8
    on_remove*: ecs_event_record_t
    on_set*: ecs_event_record_t
    on_wildcard*: ecs_event_record_t
    events*: ecs_sparse_t
    global_observers*: ecs_vec_t
    last_observer_id*: uint64
  ecs_iter_t* = struct_ecs_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1281:27
  struct_ecs_iter_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6136:8
    real_world*: ptr ecs_world_t
    offset*: int32
    count*: int32
    entities*: ptr ecs_entity_t
    ptrs*: ptr pointer
    trs*: ptr ptr ecs_table_record_t
    sizes*: ptr ecs_size_t
    table*: ptr ecs_table_t
    other_table*: ptr ecs_table_t
    ids*: ptr ecs_id_t
    sources*: ptr ecs_entity_t
    constrained_vars*: ecs_flags64_t
    set_fields*: ecs_flags32_t
    ref_fields*: ecs_flags32_t
    row_fields*: ecs_flags32_t
    up_fields*: ecs_flags32_t
    system*: ecs_entity_t
    event*: ecs_entity_t
    event_id*: ecs_id_t
    event_cur*: int32
    field_count*: int8
    term_index*: int8
    query*: ptr ecs_query_t
    param*: pointer
    ctx*: pointer
    binding_ctx*: pointer
    callback_ctx*: pointer
    run_ctx*: pointer
    delta_time*: cfloat
    delta_system_time*: cfloat
    frame_offset*: int32
    flags*: ecs_flags32_t
    interrupted_by*: ecs_entity_t
    priv_private*: ecs_iter_private_t
    next*: ecs_iter_next_action_t
    callback*: ecs_iter_action_t
    fini*: ecs_iter_fini_action_t
    chain_it*: ptr ecs_iter_t
  ecs_ref_t* = struct_ecs_ref_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1291:26
  struct_ecs_ref_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4801:8
    id*: ecs_entity_t
    table_id*: uint64
    table_version_fast*: uint32
    table_version*: uint16
    record*: ptr ecs_record_t
    ptr_field*: pointer
  ecs_type_hooks_t* = struct_ecs_type_hooks_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1296:33
  struct_ecs_type_hooks_t* {.pure, inheritable, bycopy.} = object
    ctor*: ecs_xtor_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4652:8
    dtor*: ecs_xtor_t
    copy*: ecs_copy_t
    move*: ecs_move_t
    copy_ctor*: ecs_copy_t
    move_ctor*: ecs_move_t
    ctor_move_dtor*: ecs_move_t
    move_dtor*: ecs_move_t
    cmp*: ecs_cmp_t
    equals*: ecs_equals_t
    flags*: ecs_flags32_t
    on_add*: ecs_iter_action_t
    on_set*: ecs_iter_action_t
    on_remove*: ecs_iter_action_t
    on_replace*: ecs_iter_action_t
    ctx*: pointer
    binding_ctx*: pointer
    lifecycle_ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    binding_ctx_free*: ecs_ctx_free_t
    lifecycle_ctx_free*: ecs_ctx_free_t
  ecs_type_info_t* = struct_ecs_type_info_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1301:32
  struct_ecs_type_info_t* {.pure, inheritable, bycopy.} = object
    size*: ecs_size_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4721:8
    alignment*: ecs_size_t
    hooks*: ecs_type_hooks_t
    component*: ecs_entity_t
    name*: cstring
  ecs_record_t* = struct_ecs_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1304:29
  struct_ecs_record_t* {.pure, inheritable, bycopy.} = object
    table*: ptr ecs_table_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5607:8
    row*: uint32
    dense*: int32
  ecs_component_record_t* = struct_ecs_component_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1307:39
  ecs_mixins_t* = struct_ecs_mixins_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1331:29
  struct_ecs_header_t* {.pure, inheritable, bycopy.} = object
    type_field*: int32       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1334:16
    refcount*: int32
    mixins*: ptr ecs_mixins_t
  ecs_header_t* = struct_ecs_header_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1338:3
  ecs_table_record_t* = struct_ecs_table_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1341:35
  struct_ecs_table_record_t* {.pure, inheritable, bycopy.} = object
    hdr*: ecs_table_cache_hdr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5623:8
    index*: int16
    count*: int16
    column*: int16
  struct_ecs_vec_t* {.pure, inheritable, bycopy.} = object
    array*: pointer          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1359:16
    count*: int32
    size*: int32
  ecs_vec_t* = struct_ecs_vec_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1367:3
  struct_ecs_sparse_page_t* {.pure, inheritable, bycopy.} = object
    sparse*: ptr int32       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1917:16
    data*: pointer
  ecs_sparse_page_t* = struct_ecs_sparse_page_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1921:3
  struct_ecs_sparse_t* {.pure, inheritable, bycopy.} = object
    dense*: ecs_vec_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1924:16
    pages*: ecs_vec_t
    size*: ecs_size_t
    count*: int32
    max_id*: uint64
    allocator*: ptr struct_ecs_allocator_t
    page_allocator*: ptr struct_ecs_block_allocator_t
  struct_ecs_block_allocator_t* {.pure, inheritable, bycopy.} = object
    data_size*: int32        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2360:16
    chunk_size*: int32
    chunks_per_block*: int32
    block_size*: int32
    head*: ptr ecs_block_allocator_chunk_header_t
    block_head*: ptr ecs_block_allocator_block_t
  ecs_sparse_t* = struct_ecs_sparse_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1935:3
  ecs_map_t* = struct_ecs_map_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2346:26
  struct_ecs_map_t* {.pure, inheritable, bycopy.} = object
    buckets*: ptr ecs_bucket_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2711:8
    bucket_count*: int32
    count* {.bitsize: 26'i64.}: cuint
    bucket_shift* {.bitsize: 6'i64.}: cuint
    allocator*: ptr struct_ecs_allocator_t
    change_count*: int32
    last_iterated*: ecs_map_key_t
  struct_ecs_block_allocator_block_t* {.pure, inheritable, bycopy.} = object
    memory*: pointer         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2349:16
    next*: ptr struct_ecs_block_allocator_block_t
  ecs_block_allocator_block_t* = struct_ecs_block_allocator_block_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2352:3
  struct_ecs_block_allocator_chunk_header_t* {.pure, inheritable, bycopy.} = object
    next*: ptr struct_ecs_block_allocator_chunk_header_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2355:16
  ecs_block_allocator_chunk_header_t* = struct_ecs_block_allocator_chunk_header_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2357:3
  ecs_block_allocator_t* = struct_ecs_block_allocator_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2373:3
  struct_ecs_stack_page_t* {.pure, inheritable, bycopy.} = object
    data*: pointer           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2538:16
    next*: ptr struct_ecs_stack_page_t
    sp*: int16
    id*: uint32
  ecs_stack_page_t* = struct_ecs_stack_page_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2543:3
  struct_ecs_stack_cursor_t* {.pure, inheritable, bycopy.} = object
    prev*: ptr struct_ecs_stack_cursor_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2546:16
    page*: ptr struct_ecs_stack_page_t
    sp*: int16
    is_free*: bool
    owner*: ptr struct_ecs_stack_t
  struct_ecs_stack_t* {.pure, inheritable, bycopy.} = object
    first*: ptr ecs_stack_page_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2557:16
    tail_page*: ptr ecs_stack_page_t
    tail_cursor*: ptr ecs_stack_cursor_t
    cursor_count*: int32
  ecs_stack_cursor_t* = struct_ecs_stack_cursor_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2554:3
  ecs_stack_t* = struct_ecs_stack_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2564:3
  ecs_map_data_t* = uint64   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2690:18
  ecs_map_key_t* = ecs_map_data_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2693:24
  ecs_map_val_t* = ecs_map_data_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2696:24
  struct_ecs_bucket_entry_t* {.pure, inheritable, bycopy.} = object
    key*: ecs_map_key_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2699:16
    value*: ecs_map_val_t
    next*: ptr struct_ecs_bucket_entry_t
  ecs_bucket_entry_t* = struct_ecs_bucket_entry_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2703:3
  struct_ecs_bucket_t* {.pure, inheritable, bycopy.} = object
    first*: ptr ecs_bucket_entry_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2706:16
  ecs_bucket_t* = struct_ecs_bucket_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2708:3
  struct_ecs_map_iter_t* {.pure, inheritable, bycopy.} = object
    map*: ptr ecs_map_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2724:16
    bucket*: ptr ecs_bucket_t
    entry*: ptr ecs_bucket_entry_t
    res*: ptr ecs_map_data_t
    change_count*: int32
  ecs_map_iter_t* = struct_ecs_map_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:2732:3
  struct_ecs_strbuf_list_elem* {.pure, inheritable, bycopy.} = object
    count*: int32            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3224:16
    separator*: cstring
  ecs_strbuf_list_elem* = struct_ecs_strbuf_list_elem ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3227:3
  struct_ecs_strbuf_t* {.pure, inheritable, bycopy.} = object
    content*: cstring        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3230:16
    length*: ecs_size_t
    size*: ecs_size_t
    list_stack*: array[32'i64, ecs_strbuf_list_elem]
    list_sp*: int32
    small_string*: array[512'i64, cschar]
  ecs_strbuf_t* = struct_ecs_strbuf_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3239:3
  struct_ecs_time_t* {.pure, inheritable, bycopy.} = object
    sec*: uint32             ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3492:16
    nanosec*: uint32
  ecs_time_t* = struct_ecs_time_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3495:3
  ecs_os_thread_t* = uintptr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3512:19
  uintptr_t* = culong        ## Generated based on /usr/include/stdint.h:79:27
  ecs_os_cond_t* = uintptr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3513:19
  ecs_os_mutex_t* = uintptr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3514:19
  ecs_os_dl_t* = uintptr_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3515:19
  ecs_os_sock_t* = uintptr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3516:19
  ecs_os_thread_id_t* = uint64 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3519:18
  ecs_os_proc_t* = proc (): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3522:16
  ecs_os_api_init_t* = proc (): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3526:8
  ecs_os_api_fini_t* = proc (): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3530:8
  ecs_os_api_malloc_t* = proc (a0: ecs_size_t): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3534:9
  ecs_os_api_free_t* = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3539:8
  ecs_os_api_realloc_t* = proc (a0: pointer; a1: ecs_size_t): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3544:9
  ecs_os_api_calloc_t* = proc (a0: ecs_size_t): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3550:9
  ecs_os_api_strdup_t* = proc (a0: cstring): cstring {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3555:9
  ecs_os_thread_callback_t* = proc (a0: pointer): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3560:9
  ecs_os_api_thread_new_t* = proc (a0: ecs_os_thread_callback_t; a1: pointer): ecs_os_thread_t {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3565:19
  ecs_os_api_thread_join_t* = proc (a0: ecs_os_thread_t): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3571:9
  ecs_os_api_thread_self_t* = proc (): ecs_os_thread_id_t {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3576:22
  ecs_os_api_task_new_t* = proc (a0: ecs_os_thread_callback_t; a1: pointer): ecs_os_thread_t {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3580:19
  ecs_os_api_task_join_t* = proc (a0: ecs_os_thread_t): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3586:9
  ecs_os_api_ainc_t* = proc (a0: ptr int32): int32 {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3592:11
  ecs_os_api_lainc_t* = proc (a0: ptr int64): int64 {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3597:11
  ecs_os_api_mutex_new_t* = proc (): ecs_os_mutex_t {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3603:18
  ecs_os_api_mutex_lock_t* = proc (a0: ecs_os_mutex_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3608:8
  ecs_os_api_mutex_unlock_t* = proc (a0: ecs_os_mutex_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3613:8
  ecs_os_api_mutex_free_t* = proc (a0: ecs_os_mutex_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3618:8
  ecs_os_api_cond_new_t* = proc (): ecs_os_cond_t {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3624:17
  ecs_os_api_cond_free_t* = proc (a0: ecs_os_cond_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3629:8
  ecs_os_api_cond_signal_t* = proc (a0: ecs_os_cond_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3634:8
  ecs_os_api_cond_broadcast_t* = proc (a0: ecs_os_cond_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3639:8
  ecs_os_api_cond_wait_t* = proc (a0: ecs_os_cond_t; a1: ecs_os_mutex_t): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3644:8
  ecs_os_api_sleep_t* = proc (a0: int32; a1: int32): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3650:8
  ecs_os_api_enable_high_timer_resolution_t* = proc (a0: bool): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3656:8
  ecs_os_api_get_time_t* = proc (a0: ptr ecs_time_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3661:8
  ecs_os_api_now_t* = proc (): uint64 {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3666:12
  ecs_os_api_log_t* = proc (a0: int32; a1: cstring; a2: int32; a3: cstring): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3676:8
  ecs_os_api_abort_t* = proc (): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3684:8
  ecs_os_api_dlopen_t* = proc (a0: cstring): ecs_os_dl_t {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3689:15
  ecs_os_api_dlproc_t* = proc (a0: ecs_os_dl_t; a1: cstring): ecs_os_proc_t {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3694:17
  ecs_os_api_dlclose_t* = proc (a0: ecs_os_dl_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3700:8
  ecs_os_api_module_to_path_t* = proc (a0: cstring): cstring {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3705:9
  ecs_os_api_perf_trace_t* = proc (a0: cstring; a1: csize_t; a2: cstring): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3714:16
  struct_ecs_os_api_t* {.pure, inheritable, bycopy.} = object
    init_private*: ecs_os_api_init_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3723:16
    fini_private*: ecs_os_api_fini_t
    malloc_private*: ecs_os_api_malloc_t
    realloc_private*: ecs_os_api_realloc_t
    calloc_private*: ecs_os_api_calloc_t
    free_private*: ecs_os_api_free_t
    strdup_private*: ecs_os_api_strdup_t
    thread_new_private*: ecs_os_api_thread_new_t
    thread_join_private*: ecs_os_api_thread_join_t
    thread_self_private*: ecs_os_api_thread_self_t
    task_new_private*: ecs_os_api_thread_new_t
    task_join_private*: ecs_os_api_thread_join_t
    ainc_private*: ecs_os_api_ainc_t
    adec_private*: ecs_os_api_ainc_t
    lainc_private*: ecs_os_api_lainc_t
    ladec_private*: ecs_os_api_lainc_t
    mutex_new_private*: ecs_os_api_mutex_new_t
    mutex_free_private*: ecs_os_api_mutex_free_t
    mutex_lock_private*: ecs_os_api_mutex_lock_t
    mutex_unlock_private*: ecs_os_api_mutex_lock_t
    cond_new_private*: ecs_os_api_cond_new_t
    cond_free_private*: ecs_os_api_cond_free_t
    cond_signal_private*: ecs_os_api_cond_signal_t
    cond_broadcast_private*: ecs_os_api_cond_broadcast_t
    cond_wait_private*: ecs_os_api_cond_wait_t
    sleep_private*: ecs_os_api_sleep_t
    now_private*: ecs_os_api_now_t
    get_time_private*: ecs_os_api_get_time_t
    log_private*: ecs_os_api_log_t
    abort_private*: ecs_os_api_abort_t
    dlopen_private*: ecs_os_api_dlopen_t
    dlproc_private*: ecs_os_api_dlproc_t
    dlclose_private*: ecs_os_api_dlclose_t
    module_to_dl_private*: ecs_os_api_module_to_path_t
    module_to_etc_private*: ecs_os_api_module_to_path_t
    perf_trace_push_private*: ecs_os_api_perf_trace_t
    perf_trace_pop_private*: ecs_os_api_perf_trace_t
    log_level_private*: int32
    log_indent_private*: int32
    log_last_error_private*: int32
    log_last_timestamp_private*: int64
    flags_private*: ecs_flags32_t
    log_out_private*: pointer
  ecs_os_api_t* = struct_ecs_os_api_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3808:3
  ecs_run_action_t* = proc (a0: ptr ecs_iter_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4270:16
  ecs_iter_action_t* = proc (a0: ptr ecs_iter_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4279:16
  ecs_iter_next_action_t* = proc (a0: ptr ecs_iter_t): bool {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4289:16
  ecs_iter_fini_action_t* = proc (a0: ptr ecs_iter_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4297:16
  ecs_order_by_action_t* = proc (a0: ecs_entity_t; a1: pointer;
                                 a2: ecs_entity_t; a3: pointer): cint {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4301:15
  ecs_sort_table_action_t* = proc (a0: ptr ecs_world_t; a1: ptr ecs_table_t;
                                   a2: ptr ecs_entity_t; a3: pointer; a4: int32;
                                   a5: int32; a6: int32;
                                   a7: ecs_order_by_action_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4308:16
  ecs_group_by_action_t* = proc (a0: ptr ecs_world_t; a1: ptr ecs_table_t;
                                 a2: ecs_id_t; a3: pointer): uint64 {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4319:20
  ecs_group_create_action_t* = proc (a0: ptr ecs_world_t; a1: uint64;
                                     a2: pointer): pointer {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4326:17
  ecs_group_delete_action_t* = proc (a0: ptr ecs_world_t; a1: uint64;
                                     a2: pointer; a3: pointer): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4332:16
  ecs_module_action_t* = proc (a0: ptr ecs_world_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4339:16
  ecs_fini_action_t* = proc (a0: ptr ecs_world_t; a1: pointer): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4343:16
  ecs_ctx_free_t* = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4348:16
  ecs_compare_action_t* = proc (a0: pointer; a1: pointer): cint {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4352:15
  ecs_hash_value_action_t* = proc (a0: pointer): uint64 {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4357:20
  ecs_xtor_t* = proc (a0: pointer; a1: int32; a2: ptr ecs_type_info_t): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4361:16
  ecs_copy_t* = proc (a0: pointer; a1: pointer; a2: int32;
                      a3: ptr ecs_type_info_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4367:16
  ecs_move_t* = proc (a0: pointer; a1: pointer; a2: int32;
                      a3: ptr ecs_type_info_t): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4374:16
  ecs_cmp_t* = proc (a0: pointer; a1: pointer; a2: ptr ecs_type_info_t): cint {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4381:15
  ecs_equals_t* = proc (a0: pointer; a1: pointer; a2: ptr ecs_type_info_t): bool {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4387:16
  flecs_poly_dtor_t* = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4393:16
  ecs_inout_kind_t* = enum_ecs_inout_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4413:3
  ecs_oper_kind_t* = enum_ecs_oper_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4424:3
  ecs_query_cache_kind_t* = enum_ecs_query_cache_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4432:3
  struct_ecs_term_ref_t* {.pure, inheritable, bycopy.} = object
    id*: ecs_entity_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4497:16
    name*: cstring
  ecs_term_ref_t* = struct_ecs_term_ref_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4509:3
  ecs_data_t* = struct_ecs_data_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4751:27
  ecs_query_cache_match_t* = struct_ecs_query_cache_match_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4754:40
  ecs_query_cache_group_t* = struct_ecs_query_cache_group_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4757:40
  struct_ecs_event_record_t* {.pure, inheritable, bycopy.} = object
    any*: ptr struct_ecs_event_id_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4764:16
    wildcard*: ptr struct_ecs_event_id_record_t
    wildcard_pair*: ptr struct_ecs_event_id_record_t
    event_ids*: ecs_map_t
    event*: ecs_entity_t
  ecs_event_record_t* = struct_ecs_event_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4770:3
  struct_ecs_table_range_t* {.pure, inheritable, bycopy.} = object
    table*: ptr ecs_table_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4783:16
    offset*: int32
    count*: int32
  ecs_table_range_t* = struct_ecs_table_range_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4787:3
  struct_ecs_var_t* {.pure, inheritable, bycopy.} = object
    range*: ecs_table_range_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4790:16
    entity*: ecs_entity_t
  ecs_var_t* = struct_ecs_var_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4798:3
  struct_ecs_page_iter_t* {.pure, inheritable, bycopy.} = object
    offset*: int32           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4812:16
    limit*: int32
    remaining*: int32
  ecs_page_iter_t* = struct_ecs_page_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4816:3
  struct_ecs_worker_iter_t* {.pure, inheritable, bycopy.} = object
    index*: int32            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4819:16
    count*: int32
  ecs_worker_iter_t* = struct_ecs_worker_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4822:3
  struct_ecs_table_cache_iter_t* {.pure, inheritable, bycopy.} = object
    cur*: ptr struct_ecs_table_cache_hdr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4825:16
    next*: ptr struct_ecs_table_cache_hdr_t
    iter_fill*: bool
    iter_empty*: bool
  struct_ecs_table_cache_hdr_t* {.pure, inheritable, bycopy.} = object
    cr*: ptr struct_ecs_component_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5614:16
    table*: ptr ecs_table_t
    prev*: ptr struct_ecs_table_cache_hdr_t
    next*: ptr struct_ecs_table_cache_hdr_t
  ecs_table_cache_iter_t* = struct_ecs_table_cache_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4829:3
  struct_ecs_each_iter_t* {.pure, inheritable, bycopy.} = object
    it*: ecs_table_cache_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4832:16
    ids*: ecs_id_t
    sources*: ecs_entity_t
    sizes*: ecs_size_t
    columns*: int32
    trs*: ptr ecs_table_record_t
  ecs_each_iter_t* = struct_ecs_each_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4841:3
  struct_ecs_query_op_profile_t* {.pure, inheritable, bycopy.} = object
    count*: array[2'i64, int32] ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4843:16
  ecs_query_op_profile_t* = struct_ecs_query_op_profile_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4845:3
  struct_ecs_query_iter_t* {.pure, inheritable, bycopy.} = object
    vars*: ptr struct_ecs_var_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4848:16
    query_vars*: ptr struct_ecs_query_var_t
    ops*: ptr struct_ecs_query_op_t
    op_ctx*: ptr struct_ecs_query_op_ctx_t
    written*: ptr uint64
    group*: ptr ecs_query_cache_group_t
    tables*: ptr ecs_vec_t
    all_tables*: ptr ecs_vec_t
    elem*: ptr ecs_query_cache_match_t
    cur*: int32
    all_cur*: int32
    profile*: ptr ecs_query_op_profile_t
    op*: int16
    iter_single_group*: bool
  ecs_query_iter_t* = struct_ecs_query_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4866:3
  struct_ecs_iter_private_t_iter_t* {.union, bycopy.} = object
    query*: ecs_query_iter_t
    page*: ecs_page_iter_t
    worker*: ecs_worker_iter_t
    each*: ecs_each_iter_t
  struct_ecs_iter_private_t* {.pure, inheritable, bycopy.} = object
    iter*: struct_ecs_iter_private_t_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4870:16
    entity_iter*: pointer
    stack_cursor*: ptr ecs_stack_cursor_t
  ecs_iter_private_t* = struct_ecs_iter_private_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4880:3
  struct_ecs_commands_t* {.pure, inheritable, bycopy.} = object
    queue*: ecs_vec_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4883:16
    stack*: ecs_stack_t
    entries*: ecs_sparse_t
  ecs_commands_t* = struct_ecs_commands_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4887:3
  struct_ecs_suspend_readonly_state_t* {.pure, inheritable, bycopy.} = object
    is_readonly*: bool       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5135:16
    is_deferred*: bool
    cmd_flushing*: bool
    defer_count*: int32
    scope*: ecs_entity_t
    with*: ecs_entity_t
    cmd_stack*: array[2'i64, ecs_commands_t]
    cmd*: ptr ecs_commands_t
    stage*: ptr ecs_stage_t
  ecs_suspend_readonly_state_t* = struct_ecs_suspend_readonly_state_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5145:3
  struct_ecs_hm_bucket_t* {.pure, inheritable, bycopy.} = object
    keys*: ecs_vec_t         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5364:9
    values*: ecs_vec_t
  ecs_hm_bucket_t* = struct_ecs_hm_bucket_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5367:3
  struct_ecs_hashmap_t* {.pure, inheritable, bycopy.} = object
    hash*: ecs_hash_value_action_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5370:9
    compare*: ecs_compare_action_t
    key_size*: ecs_size_t
    value_size*: ecs_size_t
    impl*: ecs_map_t
  ecs_hashmap_t* = struct_ecs_hashmap_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5376:3
  struct_flecs_hashmap_iter_t* {.pure, inheritable, bycopy.} = object
    it*: ecs_map_iter_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5379:9
    bucket*: ptr ecs_hm_bucket_t
    index*: int32
  flecs_hashmap_iter_t* = struct_flecs_hashmap_iter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5383:3
  struct_flecs_hashmap_result_t* {.pure, inheritable, bycopy.} = object
    key*: pointer            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5386:9
    value*: pointer
    hash*: uint64
  flecs_hashmap_result_t* = struct_flecs_hashmap_result_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5390:3
  ecs_table_cache_hdr_t* = struct_ecs_table_cache_hdr_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5618:3
  struct_ecs_table_diff_t* {.pure, inheritable, bycopy.} = object
    added*: ecs_type_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5632:16
    removed*: ecs_type_t
    added_flags*: ecs_flags32_t
    removed_flags*: ecs_flags32_t
  ecs_table_diff_t* = struct_ecs_table_diff_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5637:3
  struct_ecs_parent_record_t* {.pure, inheritable, bycopy.} = object
    entity*: uint32          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5640:16
    count*: int32
  ecs_parent_record_t* = struct_ecs_parent_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5643:3
  struct_ecs_table_records_t* {.pure, inheritable, bycopy.} = object
    array*: ptr ecs_table_record_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5944:16
    count*: int32
  ecs_table_records_t* = struct_ecs_table_records_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:5947:3
  struct_ecs_value_t* {.pure, inheritable, bycopy.} = object
    type_field*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6003:16
    ptr_field*: pointer
  ecs_value_t* = struct_ecs_value_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6006:3
  struct_ecs_entity_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6012:16
    id*: ecs_entity_t
    parent*: ecs_entity_t
    name*: cstring
    sep*: cstring
    root_sep*: cstring
    symbol*: cstring
    use_low_id*: bool
    add*: ptr ecs_id_t
    set*: ptr ecs_value_t
    add_expr*: cstring
  ecs_entity_desc_t* = struct_ecs_entity_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6052:3
  struct_ecs_bulk_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6058:16
    entities*: ptr ecs_entity_t
    count*: int32
    ids*: array[32'i64, ecs_id_t]
    data*: ptr pointer
    table*: ptr ecs_table_t
  ecs_bulk_desc_t* = struct_ecs_bulk_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6082:3
  struct_ecs_component_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6088:16
    entity*: ecs_entity_t
    type_field*: ecs_type_info_t
  ecs_component_desc_t* = struct_ecs_component_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6096:3
  struct_ecs_query_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6245:16
    terms*: array[32'i64, ecs_term_t]
    expr*: cstring
    cache_kind*: ecs_query_cache_kind_t
    flags*: ecs_flags32_t
    order_by_callback*: ecs_order_by_action_t
    order_by_table_callback*: ecs_sort_table_action_t
    order_by*: ecs_entity_t
    group_by*: ecs_id_t
    group_by_callback*: ecs_group_by_action_t
    on_group_create*: ecs_group_create_action_t
    on_group_delete*: ecs_group_delete_action_t
    group_by_ctx*: pointer
    group_by_ctx_free*: ecs_ctx_free_t
    ctx*: pointer
    binding_ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    binding_ctx_free*: ecs_ctx_free_t
    entity*: ecs_entity_t
  ecs_query_desc_t* = struct_ecs_query_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6313:3
  struct_ecs_observer_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6319:16
    entity*: ecs_entity_t
    query*: ecs_query_desc_t
    events*: array[8'i64, ecs_entity_t]
    yield_existing*: bool
    global_observer*: bool
    callback*: ecs_iter_action_t
    run*: ecs_run_action_t
    ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    callback_ctx*: pointer
    callback_ctx_free*: ecs_ctx_free_t
    run_ctx*: pointer
    run_ctx_free*: ecs_ctx_free_t
    last_event_id*: ptr int32
    term_index_private*: int8
    flags_private*: ecs_flags32_t
  ecs_observer_desc_t* = struct_ecs_observer_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6374:3
  struct_ecs_event_desc_t* {.pure, inheritable, bycopy.} = object
    event*: ecs_entity_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6380:16
    ids*: ptr ecs_type_t
    table*: ptr ecs_table_t
    other_table*: ptr ecs_table_t
    offset*: int32
    count*: int32
    entity*: ecs_entity_t
    param*: pointer
    const_param*: pointer
    observable*: pointer
    flags*: ecs_flags32_t
  ecs_event_desc_t* = struct_ecs_event_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6423:3
  struct_ecs_build_info_t* {.pure, inheritable, bycopy.} = object
    compiler*: cstring       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6434:16
    addons*: ptr cstring
    flags*: ptr cstring
    version*: cstring
    version_major*: int16
    version_minor*: int16
    version_patch*: int16
    debug*: bool
    sanitize*: bool
    perf_trace*: bool
  ecs_build_info_t* = struct_ecs_build_info_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6445:3
  struct_ecs_world_info_t_cmd_t* {.pure, inheritable, bycopy.} = object
    add_count*: int64
    remove_count*: int64
    delete_count*: int64
    clear_count*: int64
    set_count*: int64
    ensure_count*: int64
    modified_count*: int64
    discard_count*: int64
    event_count*: int64
    other_count*: int64
    batched_entity_count*: int64
    batched_command_count*: int64
  struct_ecs_world_info_t* {.pure, inheritable, bycopy.} = object
    last_component_id*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6448:16
    min_id*: ecs_entity_t
    max_id*: ecs_entity_t
    delta_time_raw*: cfloat
    delta_time*: cfloat
    time_scale*: cfloat
    target_fps*: cfloat
    frame_time_total*: cfloat
    system_time_total*: cfloat
    emit_time_total*: cfloat
    merge_time_total*: cfloat
    rematch_time_total*: cfloat
    world_time_total*: cdouble
    world_time_total_raw*: cdouble
    frame_count_total*: int64
    merge_count_total*: int64
    eval_comp_monitors_total*: int64
    rematch_count_total*: int64
    id_create_total*: int64
    id_delete_total*: int64
    table_create_total*: int64
    table_delete_total*: int64
    pipeline_build_count_total*: int64
    systems_ran_total*: int64
    observers_ran_total*: int64
    queries_ran_total*: int64
    tag_id_count*: int32
    component_id_count*: int32
    pair_id_count*: int32
    table_count*: int32
    creation_time*: uint32
    cmd*: struct_ecs_world_info_t_cmd_t
    name_prefix*: cstring
  ecs_world_info_t* = struct_ecs_world_info_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6507:3
  struct_ecs_query_group_info_t* {.pure, inheritable, bycopy.} = object
    id*: uint64              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6510:16
    match_count*: int32
    table_count*: int32
    ctx*: pointer
  ecs_query_group_info_t* = struct_ecs_query_group_info_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6515:3
  struct_EcsIdentifier* {.pure, inheritable, bycopy.} = object
    value*: cstring          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6527:16
    length*: ecs_size_t
    hash*: uint64
    index_hash*: uint64
    index*: ptr ecs_hashmap_t
  EcsIdentifier* = struct_EcsIdentifier ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6533:3
  struct_EcsComponent* {.pure, inheritable, bycopy.} = object
    size*: ecs_size_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6536:16
    alignment*: ecs_size_t
  EcsComponent* = struct_EcsComponent ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6539:3
  struct_EcsPoly* {.pure, inheritable, bycopy.} = object
    poly*: pointer           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6542:16
  EcsPoly* = struct_EcsPoly  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6544:3
  struct_EcsDefaultChildComponent* {.pure, inheritable, bycopy.} = object
    component*: ecs_id_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6551:16
  EcsDefaultChildComponent* = struct_EcsDefaultChildComponent ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6553:3
  struct_EcsParent* {.pure, inheritable, bycopy.} = object
    value*: ecs_entity_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6556:16
  EcsParent* = struct_EcsParent ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6558:3
  struct_ecs_tree_spawner_child_t* {.pure, inheritable, bycopy.} = object
    child_name*: cstring     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6561:9
    table*: ptr ecs_table_t
    child*: uint32
    parent_index*: int32
  ecs_tree_spawner_child_t* = struct_ecs_tree_spawner_child_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6566:3
  struct_ecs_tree_spawner_t* {.pure, inheritable, bycopy.} = object
    children*: ecs_vec_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6569:9
  ecs_tree_spawner_t* = struct_ecs_tree_spawner_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6571:3
  struct_EcsTreeSpawner* {.pure, inheritable, bycopy.} = object
    data*: array[6'i64, ecs_tree_spawner_t] ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6580:16
  EcsTreeSpawner* = struct_EcsTreeSpawner ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6582:3
  struct_ecs_entities_t* {.pure, inheritable, bycopy.} = object
    ids*: ptr ecs_entity_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:7075:16
    count*: int32
    alive_count*: int32
  ecs_entities_t* = struct_ecs_entities_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:7079:3
  struct_ecs_delete_empty_tables_desc_t* {.pure, inheritable, bycopy.} = object
    clear_generation*: uint16 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:7721:16
    delete_generation*: uint16
    time_budget_seconds*: cdouble
  ecs_delete_empty_tables_desc_t* = struct_ecs_delete_empty_tables_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:7730:3
  struct_ecs_query_count_t* {.pure, inheritable, bycopy.} = object
    results*: int32          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:10181:16
    entities*: int32
    tables*: int32
  ecs_query_count_t* = struct_ecs_query_count_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:10187:3
  ecs_app_init_action_t* = proc (a0: ptr ecs_world_t): cint {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13400:14
  struct_ecs_app_desc_t* {.pure, inheritable, bycopy.} = object
    target_fps*: cfloat      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13404:16
    delta_time*: cfloat
    threads*: int32
    frames*: int32
    enable_rest*: bool
    enable_stats*: bool
    port*: uint16
    init*: ecs_app_init_action_t
    ctx*: pointer
  ecs_app_desc_t* = struct_ecs_app_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13417:3
  ecs_app_run_action_t* = proc (a0: ptr ecs_world_t; a1: ptr ecs_app_desc_t): cint {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13420:14
  ecs_app_frame_action_t* = proc (a0: ptr ecs_world_t; a1: ptr ecs_app_desc_t): cint {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13425:14
  ecs_http_server_t* = struct_ecs_http_server_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13542:34
  struct_ecs_http_connection_t* {.pure, inheritable, bycopy.} = object
    id*: uint64              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13545:9
    server*: ptr ecs_http_server_t
    host*: array[128'i64, cschar]
    port*: array[16'i64, cschar]
  ecs_http_connection_t* = struct_ecs_http_connection_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13551:3
  struct_ecs_http_key_value_t* {.pure, inheritable, bycopy.} = object
    key*: cstring            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13554:9
    value*: cstring
  ecs_http_key_value_t* = struct_ecs_http_key_value_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13557:3
  ecs_http_method_t* = enum_ecs_http_method_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13567:3
  struct_ecs_http_request_t* {.pure, inheritable, bycopy.} = object
    id*: uint64              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13570:9
    method_field*: ecs_http_method_t
    path*: cstring
    body*: cstring
    headers*: array[32'i64, ecs_http_key_value_t]
    params*: array[32'i64, ecs_http_key_value_t]
    header_count*: int32
    param_count*: int32
    conn*: ptr ecs_http_connection_t
  ecs_http_request_t* = struct_ecs_http_request_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13582:3
  struct_ecs_http_reply_t* {.pure, inheritable, bycopy.} = object
    code*: cint              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13585:9
    body*: ecs_strbuf_t
    status*: cstring
    content_type*: cstring
    headers*: ecs_strbuf_t
  ecs_http_reply_t* = struct_ecs_http_reply_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13591:3
  ecs_http_reply_action_t* = proc (a0: ptr ecs_http_request_t;
                                   a1: ptr ecs_http_reply_t; a2: pointer): bool {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13612:16
  struct_ecs_http_server_desc_t* {.pure, inheritable, bycopy.} = object
    callback*: ecs_http_reply_action_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13618:9
    ctx*: pointer
    port*: uint16
    ipaddr*: cstring
    send_queue_wait_ms*: int32
    cache_timeout*: cdouble
    cache_purge_timeout*: cdouble
  ecs_http_server_desc_t* = struct_ecs_http_server_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13626:3
  struct_ecs_rest_ctx_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13809:9
    srv*: ptr ecs_http_server_t
    rc*: int32
    cmd_captures*: ecs_map_t
    last_time*: cdouble
  ecs_rest_ctx_t* = struct_ecs_rest_ctx_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13815:3
  struct_EcsRest* {.pure, inheritable, bycopy.} = object
    port*: uint16            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13818:9
    ipaddr*: cstring
    impl*: ptr ecs_rest_ctx_t
  EcsRest* = struct_EcsRest  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13822:3
  struct_EcsTimer* {.pure, inheritable, bycopy.} = object
    timeout*: cfloat         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13908:16
    time*: cfloat
    overshoot*: cfloat
    fired_count*: int32
    active*: bool
    single_shot*: bool
  EcsTimer* = struct_EcsTimer ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13915:3
  struct_EcsRateFilter* {.pure, inheritable, bycopy.} = object
    src*: ecs_entity_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13918:16
    rate*: int32
    tick_count*: int32
    time_elapsed*: cfloat
  EcsRateFilter* = struct_EcsRateFilter ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13923:3
  struct_ecs_pipeline_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14231:16
    query*: ecs_query_desc_t
  ecs_pipeline_desc_t* = struct_ecs_pipeline_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14259:3
  struct_EcsTickSource* {.pure, inheritable, bycopy.} = object
    tick*: bool              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14472:16
    time_elapsed*: cfloat
  EcsTickSource* = struct_EcsTickSource ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14475:3
  struct_ecs_system_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14478:16
    entity*: ecs_entity_t
    query*: ecs_query_desc_t
    phase*: ecs_entity_t
    callback*: ecs_iter_action_t
    run*: ecs_run_action_t
    ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    callback_ctx*: pointer
    callback_ctx_free*: ecs_ctx_free_t
    run_ctx*: pointer
    run_ctx_free*: ecs_ctx_free_t
    interval*: cfloat
    rate*: int32
    tick_source*: ecs_entity_t
    multi_threaded*: bool
    immediate*: bool
  ecs_system_desc_t* = struct_ecs_system_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14542:3
  struct_ecs_system_t* {.pure, inheritable, bycopy.} = object
    hdr*: ecs_header_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14556:16
    run*: ecs_run_action_t
    action*: ecs_iter_action_t
    query*: ptr ecs_query_t
    group_id*: uint64
    group_id_set*: bool
    tick_source*: ecs_entity_t
    multi_threaded*: bool
    immediate*: bool
    name*: cstring
    ctx*: pointer
    callback_ctx*: pointer
    run_ctx*: pointer
    ctx_free*: ecs_ctx_free_t
    callback_ctx_free*: ecs_ctx_free_t
    run_ctx_free*: ecs_ctx_free_t
    time_spent*: cfloat
    time_passed*: cfloat
    last_frame*: int64
    dtor*: flecs_poly_dtor_t
  ecs_system_t* = struct_ecs_system_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14615:3
  struct_ecs_gauge_t* {.pure, inheritable, bycopy.} = object
    avg*: array[60'i64, cfloat] ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14833:16
    min*: array[60'i64, cfloat]
    max*: array[60'i64, cfloat]
  ecs_gauge_t* = struct_ecs_gauge_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14837:3
  struct_ecs_counter_t* {.pure, inheritable, bycopy.} = object
    rate*: ecs_gauge_t       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14840:16
    value*: array[60'i64, cdouble]
  ecs_counter_t* = struct_ecs_counter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14843:3
  union_ecs_metric_t* {.union, bycopy.} = object
    gauge*: ecs_gauge_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14846:15
    counter*: ecs_counter_t
  ecs_metric_t* = union_ecs_metric_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14849:3
  struct_ecs_world_stats_t_entities_t* {.pure, inheritable, bycopy.} = object
    count*: ecs_metric_t
    not_alive_count*: ecs_metric_t
  struct_ecs_world_stats_t_components_t* {.pure, inheritable, bycopy.} = object
    tag_count*: ecs_metric_t
    component_count*: ecs_metric_t
    pair_count*: ecs_metric_t
    type_count*: ecs_metric_t
    create_count*: ecs_metric_t
    delete_count*: ecs_metric_t
  struct_ecs_world_stats_t_tables_t* {.pure, inheritable, bycopy.} = object
    count*: ecs_metric_t
    empty_count*: ecs_metric_t
    create_count*: ecs_metric_t
    delete_count*: ecs_metric_t
  struct_ecs_world_stats_t_queries_t* {.pure, inheritable, bycopy.} = object
    query_count*: ecs_metric_t
    observer_count*: ecs_metric_t
    system_count*: ecs_metric_t
  struct_ecs_world_stats_t_commands_t* {.pure, inheritable, bycopy.} = object
    add_count*: ecs_metric_t
    remove_count*: ecs_metric_t
    delete_count*: ecs_metric_t
    clear_count*: ecs_metric_t
    set_count*: ecs_metric_t
    ensure_count*: ecs_metric_t
    modified_count*: ecs_metric_t
    other_count*: ecs_metric_t
    discard_count*: ecs_metric_t
    batched_entity_count*: ecs_metric_t
    batched_count*: ecs_metric_t
  struct_ecs_world_stats_t_frame_t* {.pure, inheritable, bycopy.} = object
    frame_count*: ecs_metric_t
    merge_count*: ecs_metric_t
    rematch_count*: ecs_metric_t
    pipeline_build_count*: ecs_metric_t
    systems_ran*: ecs_metric_t
    observers_ran*: ecs_metric_t
    event_emit_count*: ecs_metric_t
  struct_ecs_world_stats_t_performance_t* {.pure, inheritable, bycopy.} = object
    world_time_raw*: ecs_metric_t
    world_time*: ecs_metric_t
    frame_time*: ecs_metric_t
    system_time*: ecs_metric_t
    emit_time*: ecs_metric_t
    merge_time*: ecs_metric_t
    rematch_time*: ecs_metric_t
    fps*: ecs_metric_t
    delta_time*: ecs_metric_t
  struct_ecs_world_stats_t_memory_t* {.pure, inheritable, bycopy.} = object
    alloc_count*: ecs_metric_t
    realloc_count*: ecs_metric_t
    free_count*: ecs_metric_t
    outstanding_alloc_count*: ecs_metric_t
    block_alloc_count*: ecs_metric_t
    block_free_count*: ecs_metric_t
    block_outstanding_alloc_count*: ecs_metric_t
    stack_alloc_count*: ecs_metric_t
    stack_free_count*: ecs_metric_t
    stack_outstanding_alloc_count*: ecs_metric_t
  struct_ecs_world_stats_t_http_t* {.pure, inheritable, bycopy.} = object
    request_received_count*: ecs_metric_t
    request_invalid_count*: ecs_metric_t
    request_handled_ok_count*: ecs_metric_t
    request_handled_error_count*: ecs_metric_t
    request_not_handled_count*: ecs_metric_t
    request_preflight_count*: ecs_metric_t
    send_ok_count*: ecs_metric_t
    send_error_count*: ecs_metric_t
    busy_count*: ecs_metric_t
  struct_ecs_world_stats_t* {.pure, inheritable, bycopy.} = object
    first_private*: int64    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14852:16
    entities*: struct_ecs_world_stats_t_entities_t
    components*: struct_ecs_world_stats_t_components_t
    tables*: struct_ecs_world_stats_t_tables_t
    queries*: struct_ecs_world_stats_t_queries_t
    commands*: struct_ecs_world_stats_t_commands_t
    frame*: struct_ecs_world_stats_t_frame_t
    performance*: struct_ecs_world_stats_t_performance_t
    memory*: struct_ecs_world_stats_t_memory_t
    http*: struct_ecs_world_stats_t_http_t
    last_private*: int64
    t*: int32
  ecs_world_stats_t* = struct_ecs_world_stats_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14958:3
  struct_ecs_query_stats_t* {.pure, inheritable, bycopy.} = object
    first_private*: int64    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14961:16
    result_count*: ecs_metric_t
    matched_table_count*: ecs_metric_t
    matched_entity_count*: ecs_metric_t
    last_private*: int64
    t*: int32
  ecs_query_stats_t* = struct_ecs_query_stats_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14970:3
  struct_ecs_system_stats_t* {.pure, inheritable, bycopy.} = object
    first_private*: int64    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14973:16
    time_spent*: ecs_metric_t
    last_private*: int64
    task*: bool
    query*: ecs_query_stats_t
  ecs_system_stats_t* = struct_ecs_system_stats_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14981:3
  struct_ecs_sync_stats_t* {.pure, inheritable, bycopy.} = object
    first_private*: int64    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14984:16
    time_spent*: ecs_metric_t
    commands_enqueued*: ecs_metric_t
    last_private*: int64
    system_count*: int32
    multi_threaded*: bool
    immediate*: bool
  ecs_sync_stats_t* = struct_ecs_sync_stats_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14993:3
  struct_ecs_pipeline_stats_t* {.pure, inheritable, bycopy.} = object
    canary_private*: int8    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14996:16
    systems*: ecs_vec_t
    sync_points*: ecs_vec_t
    t*: int32
    system_count*: int32
    active_system_count*: int32
    rebuild_count*: int32
  ecs_pipeline_stats_t* = struct_ecs_pipeline_stats_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15012:3
  struct_EcsStatsHeader* {.pure, inheritable, bycopy.} = object
    elapsed*: cfloat         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15231:9
    reduce_count*: int32
  EcsStatsHeader* = struct_EcsStatsHeader ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15234:3
  struct_EcsWorldStats* {.pure, inheritable, bycopy.} = object
    hdr*: EcsStatsHeader     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15237:9
    stats*: ptr ecs_world_stats_t
  EcsWorldStats* = struct_EcsWorldStats ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15240:3
  struct_EcsSystemStats* {.pure, inheritable, bycopy.} = object
    hdr*: EcsStatsHeader     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15243:9
    stats*: ecs_map_t
  EcsSystemStats* = struct_EcsSystemStats ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15246:3
  struct_EcsPipelineStats* {.pure, inheritable, bycopy.} = object
    hdr*: EcsStatsHeader     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15249:9
    stats*: ecs_map_t
  EcsPipelineStats* = struct_EcsPipelineStats ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15252:3
  struct_EcsWorldSummary* {.pure, inheritable, bycopy.} = object
    target_fps*: cdouble     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15255:9
    time_scale*: cdouble
    fps*: cdouble
    frame_time_total*: cdouble
    system_time_total*: cdouble
    merge_time_total*: cdouble
    entity_count*: int64
    table_count*: int64
    frame_count*: int64
    command_count*: int64
    merge_count*: int64
    systems_ran_total*: int64
    observers_ran_total*: int64
    queries_ran_total*: int64
    tag_count*: int32
    component_count*: int32
    pair_count*: int32
    frame_time_frame*: cdouble
    system_time_frame*: cdouble
    merge_time_frame*: cdouble
    merge_count_frame*: int64
    systems_ran_frame*: int64
    observers_ran_frame*: int64
    queries_ran_frame*: int64
    command_count_frame*: int64
    simulation_time*: cdouble
    uptime*: uint32
    build_info*: ecs_build_info_t
  EcsWorldSummary* = struct_EcsWorldSummary ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15296:3
  struct_ecs_entities_memory_t* {.pure, inheritable, bycopy.} = object
    alive_count*: int32      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15299:9
    not_alive_count*: int32
    bytes_entity_index*: ecs_size_t
    bytes_names*: ecs_size_t
    bytes_doc_strings*: ecs_size_t
  ecs_entities_memory_t* = struct_ecs_entities_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15305:3
  struct_ecs_component_memory_t* {.pure, inheritable, bycopy.} = object
    instances*: int32        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15308:9
    bytes_table_components*: ecs_size_t
    bytes_table_components_unused*: ecs_size_t
    bytes_toggle_bitsets*: ecs_size_t
    bytes_sparse_components*: ecs_size_t
  ecs_component_memory_t* = struct_ecs_component_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15314:3
  struct_ecs_component_index_memory_t* {.pure, inheritable, bycopy.} = object
    count*: int32            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15317:9
    bytes_component_record*: ecs_size_t
    bytes_table_cache*: ecs_size_t
    bytes_name_index*: ecs_size_t
    bytes_ordered_children*: ecs_size_t
    bytes_children_table_map*: ecs_size_t
    bytes_reachable_cache*: ecs_size_t
  ecs_component_index_memory_t* = struct_ecs_component_index_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15325:3
  struct_ecs_query_memory_t* {.pure, inheritable, bycopy.} = object
    count*: int32            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15328:9
    cached_count*: int32
    bytes_query*: ecs_size_t
    bytes_cache*: ecs_size_t
    bytes_group_by*: ecs_size_t
    bytes_order_by*: ecs_size_t
    bytes_plan*: ecs_size_t
    bytes_terms*: ecs_size_t
    bytes_misc*: ecs_size_t
  ecs_query_memory_t* = struct_ecs_query_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15338:3
  struct_ecs_table_memory_t* {.pure, inheritable, bycopy.} = object
    count*: int32            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15345:9
    empty_count*: int32
    column_count*: int32
    bytes_table*: ecs_size_t
    bytes_type*: ecs_size_t
    bytes_entities*: ecs_size_t
    bytes_overrides*: ecs_size_t
    bytes_column_map*: ecs_size_t
    bytes_component_map*: ecs_size_t
    bytes_dirty_state*: ecs_size_t
    bytes_edges*: ecs_size_t
  ecs_table_memory_t* = struct_ecs_table_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15357:3
  struct_ecs_table_histogram_t* {.pure, inheritable, bycopy.} = object
    entity_counts*: array[14'i64, int32] ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15360:9
  ecs_table_histogram_t* = struct_ecs_table_histogram_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15362:3
  struct_ecs_misc_memory_t* {.pure, inheritable, bycopy.} = object
    bytes_world*: ecs_size_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15365:9
    bytes_observers*: ecs_size_t
    bytes_systems*: ecs_size_t
    bytes_pipelines*: ecs_size_t
    bytes_table_lookup*: ecs_size_t
    bytes_component_record_lookup*: ecs_size_t
    bytes_locked_components*: ecs_size_t
    bytes_type_info*: ecs_size_t
    bytes_commands*: ecs_size_t
    bytes_rematch_monitor*: ecs_size_t
    bytes_component_ids*: ecs_size_t
    bytes_reflection*: ecs_size_t
    bytes_tree_spawner*: ecs_size_t
    bytes_prefab_child_indices*: ecs_size_t
    bytes_stats*: ecs_size_t
    bytes_rest*: ecs_size_t
  ecs_misc_memory_t* = struct_ecs_misc_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15382:3
  struct_ecs_allocator_memory_t* {.pure, inheritable, bycopy.} = object
    bytes_graph_edge*: ecs_size_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15386:9
    bytes_component_record*: ecs_size_t
    bytes_pair_record*: ecs_size_t
    bytes_table_diff*: ecs_size_t
    bytes_sparse_chunk*: ecs_size_t
    bytes_allocator*: ecs_size_t
    bytes_stack_allocator*: ecs_size_t
    bytes_cmd_entry_chunk*: ecs_size_t
    bytes_query_impl*: ecs_size_t
    bytes_query_cache*: ecs_size_t
    bytes_misc*: ecs_size_t
  ecs_allocator_memory_t* = struct_ecs_allocator_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15398:3
  struct_EcsWorldMemory* {.pure, inheritable, bycopy.} = object
    entities*: ecs_entities_memory_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15401:9
    components*: ecs_component_memory_t
    component_index*: ecs_component_index_memory_t
    queries*: ecs_query_memory_t
    tables*: ecs_table_memory_t
    table_histogram*: ecs_table_histogram_t
    misc*: ecs_misc_memory_t
    allocators*: ecs_allocator_memory_t
    collection_time*: cdouble
  EcsWorldMemory* = struct_EcsWorldMemory ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15411:3
  struct_EcsMetricValue* {.pure, inheritable, bycopy.} = object
    value*: cdouble          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15625:16
  EcsMetricValue* = struct_EcsMetricValue ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15627:3
  struct_EcsMetricSource* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15630:16
  EcsMetricSource* = struct_EcsMetricSource ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15632:3
  struct_ecs_metric_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15635:16
    entity*: ecs_entity_t
    member*: ecs_entity_t
    dotmember*: cstring
    id*: ecs_id_t
    targets*: bool
    kind*: ecs_entity_t
    brief*: cstring
  ecs_metric_desc_t* = struct_ecs_metric_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15665:3
  struct_EcsAlertInstance* {.pure, inheritable, bycopy.} = object
    message*: cstring        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15803:16
  EcsAlertInstance* = struct_EcsAlertInstance ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15805:3
  struct_EcsAlertsActive* {.pure, inheritable, bycopy.} = object
    info_count*: int32       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15808:16
    warning_count*: int32
    error_count*: int32
    alerts*: ecs_map_t
  EcsAlertsActive* = struct_EcsAlertsActive ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15813:3
  struct_ecs_alert_severity_filter_t* {.pure, inheritable, bycopy.} = object
    severity*: ecs_entity_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15821:16
    with*: ecs_id_t
    var_field*: cstring
    internal_var_index*: int32
  ecs_alert_severity_filter_t* = struct_ecs_alert_severity_filter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15827:3
  struct_ecs_alert_desc_t* {.pure, inheritable, bycopy.} = object
    internal_canary*: int32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15830:16
    entity*: ecs_entity_t
    query*: ecs_query_desc_t
    message*: cstring
    doc_name*: cstring
    brief*: cstring
    severity*: ecs_entity_t
    severity_filters*: array[4'i64, ecs_alert_severity_filter_t]
    retain_period*: cfloat
    member*: ecs_entity_t
    id*: ecs_id_t
    var_field*: cstring
  ecs_alert_desc_t* = struct_ecs_alert_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15886:3
  struct_ecs_from_json_desc_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16024:16
    expr*: cstring
    lookup_action*: proc (a0: ptr ecs_world_t; a1: cstring; a2: pointer): ecs_entity_t {.
        cdecl.}
    lookup_ctx*: pointer
    strict*: bool
  ecs_from_json_desc_t* = struct_ecs_from_json_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16039:3
  struct_ecs_entity_to_json_desc_t* {.pure, inheritable, bycopy.} = object
    serialize_entity_id*: bool ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16203:16
    serialize_doc*: bool
    serialize_full_paths*: bool
    serialize_inherited*: bool
    serialize_values*: bool
    serialize_builtin*: bool
    serialize_type_info*: bool
    serialize_alerts*: bool
    serialize_refs*: ecs_entity_t
    serialize_matches*: bool
    component_filter*: proc (a0: ptr ecs_world_t; a1: ecs_entity_t): bool {.
        cdecl.}
  ecs_entity_to_json_desc_t* = struct_ecs_entity_to_json_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16217:3
  struct_ecs_iter_to_json_desc_t* {.pure, inheritable, bycopy.} = object
    serialize_entity_ids*: bool ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16284:16
    serialize_values*: bool
    serialize_builtin*: bool
    serialize_doc*: bool
    serialize_full_paths*: bool
    serialize_fields*: bool
    serialize_inherited*: bool
    serialize_table*: bool
    serialize_type_info*: bool
    serialize_field_info*: bool
    serialize_query_info*: bool
    serialize_query_plan*: bool
    serialize_query_profile*: bool
    dont_serialize_results*: bool
    serialize_alerts*: bool
    serialize_refs*: ecs_entity_t
    serialize_matches*: bool
    serialize_parents_before_children*: bool
    component_filter*: proc (a0: ptr ecs_world_t; a1: ecs_entity_t): bool {.
        cdecl.}
    query*: pointer
  ecs_iter_to_json_desc_t* = struct_ecs_iter_to_json_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16308:3
  struct_ecs_world_to_json_desc_t* {.pure, inheritable, bycopy.} = object
    serialize_builtin*: bool ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16387:16
    serialize_modules*: bool
  ecs_world_to_json_desc_t* = struct_ecs_world_to_json_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16390:3
  ecs_script_template_t* = struct_ecs_script_template_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16945:38
  struct_ecs_script_var_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16948:16
    value*: ecs_value_t
    type_info*: ptr ecs_type_info_t
    sp*: int32
    is_const*: bool
  ecs_script_var_t* = struct_ecs_script_var_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16954:3
  struct_ecs_script_vars_t* {.pure, inheritable, bycopy.} = object
    parent*: ptr struct_ecs_script_vars_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16957:16
    sp*: int32
    var_index*: ecs_hashmap_t
    vars*: ecs_vec_t
    world*: ptr ecs_world_t
    stack*: ptr struct_ecs_stack_t
    cursor*: ptr ecs_stack_cursor_t
    allocator*: ptr ecs_allocator_t
  ecs_script_vars_t* = struct_ecs_script_vars_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16968:3
  struct_ecs_script_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16971:16
    name*: cstring
    code*: cstring
  ecs_script_t* = struct_ecs_script_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16975:3
  ecs_script_runtime_t* = struct_ecs_script_runtime_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16978:37
  struct_EcsScript* {.pure, inheritable, bycopy.} = object
    filename*: cstring       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16983:16
    code*: cstring
    error*: cstring
    script*: ptr ecs_script_t
    template_private*: ptr ecs_script_template_t
  EcsScript* = struct_EcsScript ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16989:3
  struct_ecs_function_ctx_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16992:16
    function*: ecs_entity_t
    ctx*: pointer
  ecs_function_ctx_t* = struct_ecs_function_ctx_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16996:3
  ecs_function_callback_t* = proc (a0: ptr ecs_function_ctx_t; a1: int32;
                                   a2: ptr ecs_value_t; a3: ptr ecs_value_t): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16999:15
  ecs_vector_function_callback_t* = proc (a0: ptr ecs_function_ctx_t; a1: int32;
      a2: ptr ecs_value_t; a3: ptr ecs_value_t; a4: int32): void {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17006:15
  struct_ecs_script_parameter_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17014:16
    type_field*: ecs_entity_t
  ecs_script_parameter_t* = struct_ecs_script_parameter_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17017:3
  struct_EcsScriptConstVar* {.pure, inheritable, bycopy.} = object
    value*: ecs_value_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17022:16
    type_info*: ptr ecs_type_info_t
  EcsScriptConstVar* = struct_EcsScriptConstVar ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17025:3
  struct_ecs_script_function_t* {.pure, inheritable, bycopy.} = object
    return_type*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17027:8
    params*: ecs_vec_t
    callback*: ecs_function_callback_t
    vector_callbacks*: array[18'i64, ecs_vector_function_callback_t]
    ctx*: pointer
  EcsScriptFunction* = struct_ecs_script_function_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17038:38
  EcsScriptMethod* = struct_ecs_script_function_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17045:38
  struct_ecs_script_eval_desc_t* {.pure, inheritable, bycopy.} = object
    vars*: ptr ecs_script_vars_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17050:16
    runtime*: ptr ecs_script_runtime_t
  ecs_script_eval_desc_t* = struct_ecs_script_eval_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17053:3
  struct_ecs_script_eval_result_t* {.pure, inheritable, bycopy.} = object
    error*: cstring          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17056:16
  ecs_script_eval_result_t* = struct_ecs_script_eval_result_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17058:3
  struct_ecs_script_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17216:16
    filename*: cstring
    code*: cstring
  ecs_script_desc_t* = struct_ecs_script_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17220:3
  struct_ecs_expr_eval_desc_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17465:16
    expr*: cstring
    vars*: ptr ecs_script_vars_t
    type_field*: ecs_entity_t
    lookup_action*: proc (a0: ptr ecs_world_t; a1: cstring; a2: pointer): ecs_entity_t {.
        cdecl.}
    lookup_ctx*: pointer
    disable_folding*: bool
    disable_dynamic_variable_binding*: bool
    allow_unresolved_identifiers*: bool
    runtime*: ptr ecs_script_runtime_t
    script_visitor*: pointer
  ecs_expr_eval_desc_t* = struct_ecs_expr_eval_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17491:3
  struct_ecs_const_var_desc_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17572:16
    parent*: ecs_entity_t
    type_field*: ecs_entity_t
    value*: pointer
  ecs_const_var_desc_t* = struct_ecs_const_var_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17585:3
  struct_ecs_vector_fn_callbacks_t* {.pure, inheritable, bycopy.} = object
    i8*: ecs_vector_function_callback_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17618:16
    i32*: ecs_vector_function_callback_t
  ecs_vector_fn_callbacks_t* = struct_ecs_vector_fn_callbacks_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17621:3
  struct_ecs_function_desc_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17624:16
    parent*: ecs_entity_t
    params*: array[16'i64, ecs_script_parameter_t]
    return_type*: ecs_entity_t
    callback*: ecs_function_callback_t
    vector_callbacks*: array[18'i64, ecs_vector_function_callback_t]
    ctx*: pointer
  ecs_function_desc_t* = struct_ecs_function_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17692:3
  ecs_expr_node_t* = struct_ecs_expr_node_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17796:32
  struct_EcsDocDescription* {.pure, inheritable, bycopy.} = object
    value*: cstring          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17892:16
  EcsDocDescription* = struct_EcsDocDescription ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:17894:3
  ecs_bool_t* = bool         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18221:14
  ecs_char_t* = cschar       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18222:14
  ecs_byte_t* = uint8        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18223:23
  ecs_u8_t* = uint8          ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18224:17
  ecs_u16_t* = uint16        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18225:18
  ecs_u32_t* = uint32        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18226:18
  ecs_u64_t* = uint64        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18227:18
  ecs_uptr_t* = uintptr_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18228:19
  ecs_i8_t* = int8           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18229:16
  ecs_i16_t* = int16         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18230:17
  ecs_i32_t* = int32         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18231:17
  ecs_i64_t* = int64         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18232:17
  ecs_iptr_t* = intptr_t     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18233:18
  intptr_t* = clong          ## Generated based on /usr/include/stdint.h:76:19
  ecs_f32_t* = cfloat        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18234:15
  ecs_f64_t* = cdouble       ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18235:16
  ecs_string_t* = cstring    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18236:15
  ecs_type_kind_t* = enum_ecs_type_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18286:3
  struct_EcsType* {.pure, inheritable, bycopy.} = object
    kind*: ecs_type_kind_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18289:16
    existing*: bool
    partial*: bool
  EcsType* = struct_EcsType  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18293:3
  ecs_primitive_kind_t* = enum_ecs_primitive_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18316:3
  struct_EcsPrimitive* {.pure, inheritable, bycopy.} = object
    kind*: ecs_primitive_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18319:16
  EcsPrimitive* = struct_EcsPrimitive ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18321:3
  struct_EcsMember* {.pure, inheritable, bycopy.} = object
    type_field*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18324:16
    count*: int32
    unit*: ecs_entity_t
    offset*: int32
    use_offset*: bool
  EcsMember* = struct_EcsMember ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18330:3
  struct_ecs_member_value_range_t* {.pure, inheritable, bycopy.} = object
    min*: cdouble            ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18333:16
    max*: cdouble
  ecs_member_value_range_t* = struct_ecs_member_value_range_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18336:3
  struct_EcsMemberRanges* {.pure, inheritable, bycopy.} = object
    value*: ecs_member_value_range_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18339:16
    warning*: ecs_member_value_range_t
    error*: ecs_member_value_range_t
  EcsMemberRanges* = struct_EcsMemberRanges ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18343:3
  struct_ecs_member_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18346:16
    type_field*: ecs_entity_t
    count*: int32
    offset*: int32
    unit*: ecs_entity_t
    use_offset*: bool
    range*: ecs_member_value_range_t
    error_range*: ecs_member_value_range_t
    warning_range*: ecs_member_value_range_t
    size*: ecs_size_t
    member*: ecs_entity_t
  ecs_member_t* = struct_ecs_member_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18387:3
  struct_EcsStruct* {.pure, inheritable, bycopy.} = object
    members*: ecs_vec_t      ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18390:16
  EcsStruct* = struct_EcsStruct ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18393:3
  struct_ecs_enum_constant_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18396:16
    value*: int64
    value_unsigned*: uint64
    constant*: ecs_entity_t
  ecs_enum_constant_t* = struct_ecs_enum_constant_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18408:3
  struct_EcsEnum* {.pure, inheritable, bycopy.} = object
    underlying_type*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18411:16
  EcsEnum* = struct_EcsEnum  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18413:3
  struct_ecs_bitmask_constant_t* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18416:16
    value*: ecs_flags64_t
    internal_unused*: int64
    constant*: ecs_entity_t
  ecs_bitmask_constant_t* = struct_ecs_bitmask_constant_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18428:3
  struct_EcsBitmask* {.pure, inheritable, bycopy.} = object
    dummy_private*: int32    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18431:16
  EcsBitmask* = struct_EcsBitmask ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18433:3
  struct_EcsConstants* {.pure, inheritable, bycopy.} = object
    constants*: ptr ecs_map_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18436:16
    ordered_constants*: ecs_vec_t
  EcsConstants* = struct_EcsConstants ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18442:3
  struct_EcsArray* {.pure, inheritable, bycopy.} = object
    type_field*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18445:16
    count*: int32
  EcsArray* = struct_EcsArray ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18448:3
  struct_EcsVector* {.pure, inheritable, bycopy.} = object
    type_field*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18451:16
  EcsVector* = struct_EcsVector ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18453:3
  struct_ecs_serializer_t* {.pure, inheritable, bycopy.} = object
    value*: proc (a0: ptr struct_ecs_serializer_t; a1: ecs_entity_t; a2: pointer): cint {.
        cdecl.}              ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18461:16
    member*: proc (a0: ptr struct_ecs_serializer_t; a1: cstring): cint {.cdecl.}
    world*: ptr ecs_world_t
    ctx*: pointer
  ecs_serializer_t* = struct_ecs_serializer_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18475:3
  ecs_meta_serialize_t* = proc (a0: ptr ecs_serializer_t; a1: pointer): cint {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18512:15
  ecs_meta_serialize_member_t* = proc (a0: ptr ecs_serializer_t; a1: pointer;
                                       a2: cstring): cint {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18518:15
  ecs_meta_serialize_element_t* = proc (a0: ptr ecs_serializer_t; a1: pointer;
                                        a2: csize_t): cint {.cdecl.} ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18524:15
  struct_EcsOpaque* {.pure, inheritable, bycopy.} = object
    as_type*: ecs_entity_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18534:16
    serialize*: ecs_meta_serialize_t
    serialize_member*: ecs_meta_serialize_member_t
    serialize_element*: ecs_meta_serialize_element_t
    assign_bool*: proc (a0: pointer; a1: bool): void {.cdecl.}
    assign_char*: proc (a0: pointer; a1: cschar): void {.cdecl.}
    assign_int*: proc (a0: pointer; a1: int64): void {.cdecl.}
    assign_uint*: proc (a0: pointer; a1: uint64): void {.cdecl.}
    assign_float*: proc (a0: pointer; a1: cdouble): void {.cdecl.}
    assign_string*: proc (a0: pointer; a1: cstring): void {.cdecl.}
    assign_entity*: proc (a0: pointer; a1: ptr ecs_world_t; a2: ecs_entity_t): void {.
        cdecl.}
    assign_id*: proc (a0: pointer; a1: ptr ecs_world_t; a2: ecs_id_t): void {.
        cdecl.}
    assign_null*: proc (a0: pointer): void {.cdecl.}
    clear*: proc (a0: pointer): void {.cdecl.}
    ensure_element*: proc (a0: pointer; a1: csize_t): pointer {.cdecl.}
    ensure_member*: proc (a0: pointer; a1: cstring): pointer {.cdecl.}
    count*: proc (a0: pointer): csize_t {.cdecl.}
    resize*: proc (a0: pointer; a1: csize_t): void {.cdecl.}
  EcsOpaque* = struct_EcsOpaque ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18614:3
  struct_ecs_unit_translation_t* {.pure, inheritable, bycopy.} = object
    factor*: int32           ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18626:16
    power*: int32
  ecs_unit_translation_t* = struct_ecs_unit_translation_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18629:3
  struct_EcsUnit* {.pure, inheritable, bycopy.} = object
    symbol*: cstring         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18632:16
    prefix*: ecs_entity_t
    base*: ecs_entity_t
    over*: ecs_entity_t
    translation*: ecs_unit_translation_t
  EcsUnit* = struct_EcsUnit  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18638:3
  struct_EcsUnitPrefix* {.pure, inheritable, bycopy.} = object
    symbol*: cstring         ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18641:16
    translation*: ecs_unit_translation_t
  EcsUnitPrefix* = struct_EcsUnitPrefix ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18644:3
  ecs_meta_op_kind_t* = enum_ecs_meta_op_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18692:3
  struct_ecs_meta_op_t_is_field_t* {.union, bycopy.} = object
    members*: ptr ecs_hashmap_t
    constants*: ptr ecs_map_t
    opaque*: ecs_meta_serialize_t
  struct_ecs_meta_op_t* {.pure, inheritable, bycopy.} = object
    kind*: ecs_meta_op_kind_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18695:16
    underlying_kind*: ecs_meta_op_kind_t
    offset*: ecs_size_t
    name*: cstring
    elem_size*: ecs_size_t
    op_count*: int16
    member_index*: int16
    type_field*: ecs_entity_t
    type_info*: ptr ecs_type_info_t
    is_field*: struct_ecs_meta_op_t_is_field_t
  ecs_meta_op_t* = struct_ecs_meta_op_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18710:3
  struct_EcsTypeSerializer* {.pure, inheritable, bycopy.} = object
    kind*: ecs_type_kind_t   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18714:16
    ops*: ecs_vec_t
  EcsTypeSerializer* = struct_EcsTypeSerializer ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18717:3
  struct_ecs_meta_scope_t* {.pure, inheritable, bycopy.} = object
    type_field*: ecs_entity_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18728:16
    ops*: ptr ecs_meta_op_t
    ops_count*: int16
    ops_cur*: int16
    prev_depth*: int16
    ptr_field*: pointer
    opaque*: ptr EcsOpaque
    members*: ptr ecs_hashmap_t
    is_collection*: bool
    is_empty_scope*: bool
    is_moved_scope*: bool
    elem*: int32
    elem_count*: int32
  ecs_meta_scope_t* = struct_ecs_meta_scope_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18741:3
  struct_ecs_meta_cursor_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18744:16
    scope*: array[32'i64, ecs_meta_scope_t]
    depth*: int16
    valid*: bool
    is_primitive_scope*: bool
    lookup_action*: proc (a0: ptr ecs_world_t; a1: cstring; a2: pointer): ecs_entity_t {.
        cdecl.}
    lookup_ctx*: pointer
  ecs_meta_cursor_t* = struct_ecs_meta_cursor_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18754:3
  struct_ecs_primitive_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19154:16
    kind*: ecs_primitive_kind_t
  ecs_primitive_desc_t* = struct_ecs_primitive_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19157:3
  struct_ecs_enum_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19172:16
    constants*: array[32'i64, ecs_enum_constant_t]
    underlying_type*: ecs_entity_t
  ecs_enum_desc_t* = struct_ecs_enum_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19176:3
  struct_ecs_bitmask_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19191:16
    constants*: array[32'i64, ecs_bitmask_constant_t]
  ecs_bitmask_desc_t* = struct_ecs_bitmask_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19194:3
  struct_ecs_array_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19209:16
    type_field*: ecs_entity_t
    count*: int32
  ecs_array_desc_t* = struct_ecs_array_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19213:3
  struct_ecs_vector_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19228:16
    type_field*: ecs_entity_t
  ecs_vector_desc_t* = struct_ecs_vector_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19231:3
  struct_ecs_struct_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19246:16
    members*: array[32'i64, ecs_member_t]
    create_member_entities*: bool
  ecs_struct_desc_t* = struct_ecs_struct_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19250:3
  struct_ecs_opaque_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19304:16
    type_field*: EcsOpaque
  ecs_opaque_desc_t* = struct_ecs_opaque_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19307:3
  struct_ecs_unit_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19338:16
    symbol*: cstring
    quantity*: ecs_entity_t
    base*: ecs_entity_t
    over*: ecs_entity_t
    translation*: ecs_unit_translation_t
    prefix*: ecs_entity_t
  ecs_unit_desc_t* = struct_ecs_unit_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19364:3
  struct_ecs_unit_prefix_desc_t* {.pure, inheritable, bycopy.} = object
    entity*: ecs_entity_t    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19379:16
    symbol*: cstring
    translation*: ecs_unit_translation_t
  ecs_unit_prefix_desc_t* = struct_ecs_unit_prefix_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19388:3
  ecs_cpp_type_action_t* = proc (a0: ptr ecs_world_t; a1: ecs_entity_t): void {.
      cdecl.}                ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19923:16
  struct_ecs_cpp_component_desc_t* {.pure, inheritable, bycopy.} = object
    id*: ecs_entity_t        ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19927:16
    ids_index*: int32
    name*: cstring
    cpp_name*: cstring
    cpp_symbol*: cstring
    size*: csize_t
    alignment*: csize_t
    lifecycle_action*: ecs_cpp_type_action_t
    enum_action*: ecs_cpp_type_action_t
    is_component*: bool
    explicit_registration*: bool
  ecs_cpp_component_desc_t* = struct_ecs_cpp_component_desc_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19939:3
  struct_ecs_cpp_get_mut_t* {.pure, inheritable, bycopy.} = object
    world*: ptr ecs_world_t  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19985:16
    stage*: ptr ecs_stage_t
    ptr_field*: pointer
    call_modified*: bool
  ecs_cpp_get_mut_t* = struct_ecs_cpp_get_mut_t ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19990:3
when 4 is static:
  const
    FLECS_VERSION_MAJOR* = 4 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:36:9
else:
  let FLECS_VERSION_MAJOR* = 4 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:36:9
when 1 is static:
  const
    FLECS_VERSION_MINOR* = 1 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:37:9
else:
  let FLECS_VERSION_MINOR* = 1 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:37:9
when 5 is static:
  const
    FLECS_VERSION_PATCH* = 5 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:38:9
else:
  let FLECS_VERSION_PATCH* = 5 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:38:9
when float is typedesc:
  type
    ecs_float_t* = float     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:54:9
else:
  when float is static:
    const
      ecs_float_t* = float   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:54:9
  else:
    let ecs_float_t* = float ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:54:9
when 256 is static:
  const
    FLECS_HI_COMPONENT_ID* = 256 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:275:9
else:
  let FLECS_HI_COMPONENT_ID* = 256 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:275:9
when 1024 is static:
  const
    FLECS_HI_ID_RECORD_ID* = 1024 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:285:9
else:
  let FLECS_HI_ID_RECORD_ID* = 1024 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:285:9
when 6 is static:
  const
    FLECS_SPARSE_PAGE_BITS* = 6 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:294:9
else:
  let FLECS_SPARSE_PAGE_BITS* = 6 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:294:9
when 10 is static:
  const
    FLECS_ENTITY_PAGE_BITS* = 10 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:300:9
else:
  let FLECS_ENTITY_PAGE_BITS* = 10 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:300:9
when 32 is static:
  const
    FLECS_ID_DESC_MAX* = 32  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:312:9
else:
  let FLECS_ID_DESC_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:312:9
when 8 is static:
  const
    FLECS_EVENT_DESC_MAX* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:318:9
else:
  let FLECS_EVENT_DESC_MAX* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:318:9
when 64 is static:
  const
    FLECS_VARIABLE_COUNT_MAX* = 64 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:323:9
else:
  let FLECS_VARIABLE_COUNT_MAX* = 64 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:323:9
when 32 is static:
  const
    FLECS_TERM_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:328:9
else:
  let FLECS_TERM_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:328:9
when 16 is static:
  const
    FLECS_TERM_ARG_COUNT_MAX* = 16 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:334:9
else:
  let FLECS_TERM_ARG_COUNT_MAX* = 16 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:334:9
when 64 is static:
  const
    FLECS_QUERY_VARIABLE_COUNT_MAX* = 64 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:340:9
else:
  let FLECS_QUERY_VARIABLE_COUNT_MAX* = 64 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:340:9
when 8 is static:
  const
    FLECS_QUERY_SCOPE_NESTING_MAX* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:346:9
else:
  let FLECS_QUERY_SCOPE_NESTING_MAX* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:346:9
when 128 is static:
  const
    FLECS_DAG_DEPTH_MAX* = 128 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:354:9
else:
  let FLECS_DAG_DEPTH_MAX* = 128 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:354:9
when 6 is static:
  const
    FLECS_TREE_SPAWNER_DEPTH_CACHE_SIZE* = 6 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:361:9
else:
  let FLECS_TREE_SPAWNER_DEPTH_CACHE_SIZE* = 6 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:361:9
when FLECS_API is typedesc:
  type
    FLECS_DBG_API* = FLECS_API ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:871:9
else:
  when FLECS_API is static:
    const
      FLECS_DBG_API* = FLECS_API ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:871:9
  else:
    let FLECS_DBG_API* = FLECS_API ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:871:9
when 1701016439 is static:
  const
    ecs_world_t_magic* = 1701016439 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1019:9
else:
  let ecs_world_t_magic* = 1701016439 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1019:9
when 1701016435 is static:
  const
    ecs_stage_t_magic* = 1701016435 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1020:9
else:
  let ecs_stage_t_magic* = 1701016435 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1020:9
when 1701016437 is static:
  const
    ecs_query_t_magic* = 1701016437 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1021:9
else:
  let ecs_query_t_magic* = 1701016437 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1021:9
when 1701016418 is static:
  const
    ecs_observer_t_magic* = 1701016418 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1022:9
else:
  let ecs_observer_t_magic* = 1701016418 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1022:9
when cast[cuint](268435455'i64) is static:
  const
    ECS_ROW_MASK* = cast[cuint](268435455'i64) ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1029:9
else:
  let ECS_ROW_MASK* = cast[cuint](268435455'i64) ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1029:9
when cast[culonglong](4294967295'i64) is static:
  const
    ECS_ENTITY_MASK* = cast[culonglong](4294967295'i64) ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1036:9
else:
  let ECS_ENTITY_MASK* = cast[culonglong](4294967295'i64) ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1036:9
when ecs_pair_first is typedesc:
  type
    ecs_pair_relation* = ecs_pair_first ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1071:9
else:
  when ecs_pair_first is static:
    const
      ecs_pair_relation* = ecs_pair_first ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1071:9
  else:
    let ecs_pair_relation* = ecs_pair_first ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1071:9
when ecs_pair_second is typedesc:
  type
    ecs_pair_target* = ecs_pair_second ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1072:9
else:
  when ecs_pair_second is static:
    const
      ecs_pair_target* = ecs_pair_second ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1072:9
  else:
    let ecs_pair_target* = ecs_pair_second ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:1072:9
when 512 is static:
  const
    ECS_STRBUF_SMALL_STRING_SIZE* = 512 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3218:9
else:
  let ECS_STRBUF_SMALL_STRING_SIZE* = 512 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3218:9
when 32 is static:
  const
    ECS_STRBUF_MAX_LIST_DEPTH* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3221:9
else:
  let ECS_STRBUF_MAX_LIST_DEPTH* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:3221:9
when 512 is static:
  const
    ECS_MAX_RECURSION* = 512 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4920:9
else:
  let ECS_MAX_RECURSION* = 512 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4920:9
when 256 is static:
  const
    ECS_MAX_TOKEN_SIZE* = 256 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4923:9
else:
  let ECS_MAX_TOKEN_SIZE* = 256 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:4923:9
when 8 is static:
  const
    EcsFirstUserComponentId* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6980:9
else:
  let EcsFirstUserComponentId* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:6980:9
when ECS_DECLARE is typedesc:
  type
    ECS_ENTITY_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11591:9
else:
  when ECS_DECLARE is static:
    const
      ECS_ENTITY_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11591:9
  else:
    let ECS_ENTITY_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11591:9
when ECS_DECLARE is typedesc:
  type
    ECS_TAG_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11628:9
else:
  when ECS_DECLARE is static:
    const
      ECS_TAG_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11628:9
  else:
    let ECS_TAG_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11628:9
when ECS_DECLARE is typedesc:
  type
    ECS_PREFAB_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11651:9
else:
  when ECS_DECLARE is static:
    const
      ECS_PREFAB_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11651:9
  else:
    let ECS_PREFAB_DECLARE* = ECS_DECLARE ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:11651:9
when ecs_dbg_1 is typedesc:
  type
    ecs_dbg* = ecs_dbg_1     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13040:9
else:
  when ecs_dbg_1 is static:
    const
      ecs_dbg* = ecs_dbg_1   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13040:9
  else:
    let ecs_dbg* = ecs_dbg_1 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13040:9
when 1 is static:
  const
    ECS_INVALID_OPERATION* = 1 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13244:9
else:
  let ECS_INVALID_OPERATION* = 1 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13244:9
when 2 is static:
  const
    ECS_INVALID_PARAMETER* = 2 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13246:9
else:
  let ECS_INVALID_PARAMETER* = 2 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13246:9
when 3 is static:
  const
    ECS_CONSTRAINT_VIOLATED* = 3 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13248:9
else:
  let ECS_CONSTRAINT_VIOLATED* = 3 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13248:9
when 4 is static:
  const
    ECS_OUT_OF_MEMORY* = 4   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13250:9
else:
  let ECS_OUT_OF_MEMORY* = 4 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13250:9
when 5 is static:
  const
    ECS_OUT_OF_RANGE* = 5    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13252:9
else:
  let ECS_OUT_OF_RANGE* = 5  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13252:9
when 6 is static:
  const
    ECS_UNSUPPORTED* = 6     ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13254:9
else:
  let ECS_UNSUPPORTED* = 6   ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13254:9
when 7 is static:
  const
    ECS_INTERNAL_ERROR* = 7  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13256:9
else:
  let ECS_INTERNAL_ERROR* = 7 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13256:9
when 8 is static:
  const
    ECS_ALREADY_DEFINED* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13258:9
else:
  let ECS_ALREADY_DEFINED* = 8 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13258:9
when 9 is static:
  const
    ECS_MISSING_OS_API* = 9  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13260:9
else:
  let ECS_MISSING_OS_API* = 9 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13260:9
when 10 is static:
  const
    ECS_OPERATION_FAILED* = 10 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13262:9
else:
  let ECS_OPERATION_FAILED* = 10 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13262:9
when 11 is static:
  const
    ECS_INVALID_CONVERSION* = 11 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13264:9
else:
  let ECS_INVALID_CONVERSION* = 11 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13264:9
when 13 is static:
  const
    ECS_CYCLE_DETECTED* = 13 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13266:9
else:
  let ECS_CYCLE_DETECTED* = 13 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13266:9
when 14 is static:
  const
    ECS_LEAK_DETECTED* = 14  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13268:9
else:
  let ECS_LEAK_DETECTED* = 14 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13268:9
when 15 is static:
  const
    ECS_DOUBLE_FREE* = 15    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13270:9
else:
  let ECS_DOUBLE_FREE* = 15  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13270:9
when 20 is static:
  const
    ECS_INCONSISTENT_NAME* = 20 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13273:9
else:
  let ECS_INCONSISTENT_NAME* = 20 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13273:9
when 21 is static:
  const
    ECS_NAME_IN_USE* = 21    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13275:9
else:
  let ECS_NAME_IN_USE* = 21  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13275:9
when 23 is static:
  const
    ECS_INVALID_COMPONENT_SIZE* = 23 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13277:9
else:
  let ECS_INVALID_COMPONENT_SIZE* = 23 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13277:9
when 24 is static:
  const
    ECS_INVALID_COMPONENT_ALIGNMENT* = 24 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13279:9
else:
  let ECS_INVALID_COMPONENT_ALIGNMENT* = 24 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13279:9
when 25 is static:
  const
    ECS_COMPONENT_NOT_REGISTERED* = 25 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13281:9
else:
  let ECS_COMPONENT_NOT_REGISTERED* = 25 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13281:9
when 26 is static:
  const
    ECS_INCONSISTENT_COMPONENT_ID* = 26 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13283:9
else:
  let ECS_INCONSISTENT_COMPONENT_ID* = 26 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13283:9
when 27 is static:
  const
    ECS_INCONSISTENT_COMPONENT_ACTION* = 27 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13285:9
else:
  let ECS_INCONSISTENT_COMPONENT_ACTION* = 27 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13285:9
when 28 is static:
  const
    ECS_MODULE_UNDEFINED* = 28 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13287:9
else:
  let ECS_MODULE_UNDEFINED* = 28 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13287:9
when 29 is static:
  const
    ECS_MISSING_SYMBOL* = 29 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13289:9
else:
  let ECS_MISSING_SYMBOL* = 29 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13289:9
when 30 is static:
  const
    ECS_ALREADY_IN_USE* = 30 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13291:9
else:
  let ECS_ALREADY_IN_USE* = 30 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13291:9
when 40 is static:
  const
    ECS_ACCESS_VIOLATION* = 40 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13294:9
else:
  let ECS_ACCESS_VIOLATION* = 40 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13294:9
when 41 is static:
  const
    ECS_COLUMN_INDEX_OUT_OF_RANGE* = 41 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13296:9
else:
  let ECS_COLUMN_INDEX_OUT_OF_RANGE* = 41 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13296:9
when 42 is static:
  const
    ECS_COLUMN_IS_NOT_SHARED* = 42 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13298:9
else:
  let ECS_COLUMN_IS_NOT_SHARED* = 42 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13298:9
when 43 is static:
  const
    ECS_COLUMN_IS_SHARED* = 43 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13300:9
else:
  let ECS_COLUMN_IS_SHARED* = 43 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13300:9
when 45 is static:
  const
    ECS_COLUMN_TYPE_MISMATCH* = 45 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13302:9
else:
  let ECS_COLUMN_TYPE_MISMATCH* = 45 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13302:9
when 70 is static:
  const
    ECS_INVALID_WHILE_READONLY* = 70 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13305:9
else:
  let ECS_INVALID_WHILE_READONLY* = 70 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13305:9
when 71 is static:
  const
    ECS_LOCKED_STORAGE* = 71 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13307:9
else:
  let ECS_LOCKED_STORAGE* = 71 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13307:9
when 72 is static:
  const
    ECS_INVALID_FROM_WORKER* = 72 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13309:9
else:
  let ECS_INVALID_FROM_WORKER* = 72 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13309:9
when "\\033[1;30m" is static:
  const
    ECS_BLACK* = "\\033[1;30m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13317:9
else:
  let ECS_BLACK* = "\\033[1;30m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13317:9
when "\\033[0;31m" is static:
  const
    ECS_RED* = "\\033[0;31m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13319:9
else:
  let ECS_RED* = "\\033[0;31m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13319:9
when "\\033[0;32m" is static:
  const
    ECS_GREEN* = "\\033[0;32m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13321:9
else:
  let ECS_GREEN* = "\\033[0;32m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13321:9
when "\\033[0;33m" is static:
  const
    ECS_YELLOW* = "\\033[0;33m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13323:9
else:
  let ECS_YELLOW* = "\\033[0;33m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13323:9
when "\\033[0;34m" is static:
  const
    ECS_BLUE* = "\\033[0;34m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13325:9
else:
  let ECS_BLUE* = "\\033[0;34m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13325:9
when "\\033[0;35m" is static:
  const
    ECS_MAGENTA* = "\\033[0;35m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13327:9
else:
  let ECS_MAGENTA* = "\\033[0;35m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13327:9
when "\\033[0;36m" is static:
  const
    ECS_CYAN* = "\\033[0;36m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13329:9
else:
  let ECS_CYAN* = "\\033[0;36m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13329:9
when "\\033[1;37m" is static:
  const
    ECS_WHITE* = "\\033[1;37m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13331:9
else:
  let ECS_WHITE* = "\\033[1;37m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13331:9
when "\\033[0;37m" is static:
  const
    ECS_GREY* = "\\033[0;37m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13333:9
else:
  let ECS_GREY* = "\\033[0;37m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13333:9
when "\\033[0;49m" is static:
  const
    ECS_NORMAL* = "\\033[0;49m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13335:9
else:
  let ECS_NORMAL* = "\\033[0;49m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13335:9
when "\\033[1;49m" is static:
  const
    ECS_BOLD* = "\\033[1;49m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13337:9
else:
  let ECS_BOLD* = "\\033[1;49m" ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13337:9
when 32 is static:
  const
    ECS_HTTP_HEADER_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13532:9
else:
  let ECS_HTTP_HEADER_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13532:9
when 32 is static:
  const
    ECS_HTTP_QUERY_PARAM_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13535:9
else:
  let ECS_HTTP_QUERY_PARAM_COUNT_MAX* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13535:9
when 27750 is static:
  const
    ECS_REST_DEFAULT_PORT* = 27750 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13803:9
else:
  let ECS_REST_DEFAULT_PORT* = 27750 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:13803:9
when 60 is static:
  const
    ECS_STAT_WINDOW* = 60    ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14830:9
else:
  let ECS_STAT_WINDOW* = 60  ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:14830:9
when 14 is static:
  const
    ECS_TABLE_MEMORY_HISTOGRAM_BUCKET_COUNT* = 14 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15341:9
else:
  let ECS_TABLE_MEMORY_HISTOGRAM_BUCKET_COUNT* = 14 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15341:9
when 4 is static:
  const
    ECS_ALERT_MAX_SEVERITY_FILTERS* = 4 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15784:9
else:
  let ECS_ALERT_MAX_SEVERITY_FILTERS* = 4 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:15784:9
when 16 is static:
  const
    FLECS_SCRIPT_FUNCTION_ARGS_MAX* = 16 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16921:9
else:
  let FLECS_SCRIPT_FUNCTION_ARGS_MAX* = 16 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16921:9
when 18 is static:
  const
    FLECS_SCRIPT_VECTOR_FUNCTION_COUNT* = 18 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16924:9
else:
  let FLECS_SCRIPT_VECTOR_FUNCTION_COUNT* = 18 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:16924:9
when 32 is static:
  const
    ECS_MEMBER_DESC_CACHE_SIZE* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18205:9
else:
  let ECS_MEMBER_DESC_CACHE_SIZE* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18205:9
when 32 is static:
  const
    ECS_META_MAX_SCOPE_DEPTH* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18725:9
else:
  let ECS_META_MAX_SCOPE_DEPTH* = 32 ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:18725:9
when ECS_STRUCT_IMPL is typedesc:
  type
    ECS_STRUCT_ECS_META_IMPL* = ECS_STRUCT_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19557:9
else:
  when ECS_STRUCT_IMPL is static:
    const
      ECS_STRUCT_ECS_META_IMPL* = ECS_STRUCT_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19557:9
  else:
    let ECS_STRUCT_ECS_META_IMPL* = ECS_STRUCT_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19557:9
when ECS_ENUM_IMPL is typedesc:
  type
    ECS_ENUM_ECS_META_IMPL* = ECS_ENUM_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19577:9
else:
  when ECS_ENUM_IMPL is static:
    const
      ECS_ENUM_ECS_META_IMPL* = ECS_ENUM_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19577:9
  else:
    let ECS_ENUM_ECS_META_IMPL* = ECS_ENUM_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19577:9
when ECS_BITMASK_IMPL is typedesc:
  type
    ECS_BITMASK_ECS_META_IMPL* = ECS_BITMASK_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19597:9
else:
  when ECS_BITMASK_IMPL is static:
    const
      ECS_BITMASK_ECS_META_IMPL* = ECS_BITMASK_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19597:9
  else:
    let ECS_BITMASK_ECS_META_IMPL* = ECS_BITMASK_IMPL ## Generated based on /home/lyj/代码/flecs_nim/flecs/distr/flecs.h:19597:9
proc ecs_vec_init*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                   size: ecs_size_t; elem_count: int32): void {.cdecl,
    importc: "ecs_vec_init".}
proc ecs_vec_init_w_dbg_info*(allocator: ptr struct_ecs_allocator_t;
                              vec: ptr ecs_vec_t; size: ecs_size_t;
                              elem_count: int32; type_name: cstring): void {.
    cdecl, importc: "ecs_vec_init_w_dbg_info".}
proc ecs_vec_init_if*(vec: ptr ecs_vec_t; size: ecs_size_t): void {.cdecl,
    importc: "ecs_vec_init_if".}
proc ecs_vec_fini*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                   size: ecs_size_t): void {.cdecl, importc: "ecs_vec_fini".}
proc ecs_vec_reset*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                    size: ecs_size_t): ptr ecs_vec_t {.cdecl,
    importc: "ecs_vec_reset".}
proc ecs_vec_clear*(vec: ptr ecs_vec_t): void {.cdecl, importc: "ecs_vec_clear".}
proc ecs_vec_append*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                     size: ecs_size_t): pointer {.cdecl,
    importc: "ecs_vec_append".}
proc ecs_vec_remove*(vec: ptr ecs_vec_t; size: ecs_size_t; elem: int32): void {.
    cdecl, importc: "ecs_vec_remove".}
proc ecs_vec_remove_ordered*(v: ptr ecs_vec_t; size: ecs_size_t; index: int32): void {.
    cdecl, importc: "ecs_vec_remove_ordered".}
proc ecs_vec_remove_last*(vec: ptr ecs_vec_t): void {.cdecl,
    importc: "ecs_vec_remove_last".}
proc ecs_vec_copy*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                   size: ecs_size_t): ecs_vec_t {.cdecl, importc: "ecs_vec_copy".}
proc ecs_vec_copy_shrink*(allocator: ptr struct_ecs_allocator_t;
                          vec: ptr ecs_vec_t; size: ecs_size_t): ecs_vec_t {.
    cdecl, importc: "ecs_vec_copy_shrink".}
proc ecs_vec_reclaim*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                      size: ecs_size_t): void {.cdecl,
    importc: "ecs_vec_reclaim".}
proc ecs_vec_set_size*(allocator: ptr struct_ecs_allocator_t;
                       vec: ptr ecs_vec_t; size: ecs_size_t; elem_count: int32): void {.
    cdecl, importc: "ecs_vec_set_size".}
proc ecs_vec_set_min_size*(allocator: ptr struct_ecs_allocator_t;
                           vec: ptr ecs_vec_t; size: ecs_size_t;
                           elem_count: int32): void {.cdecl,
    importc: "ecs_vec_set_min_size".}
proc ecs_vec_set_min_size_w_type_info*(allocator: ptr struct_ecs_allocator_t;
                                       vec: ptr ecs_vec_t; size: ecs_size_t;
                                       elem_count: int32;
                                       ti: ptr ecs_type_info_t): void {.cdecl,
    importc: "ecs_vec_set_min_size_w_type_info".}
proc ecs_vec_set_min_count*(allocator: ptr struct_ecs_allocator_t;
                            vec: ptr ecs_vec_t; size: ecs_size_t;
                            elem_count: int32): void {.cdecl,
    importc: "ecs_vec_set_min_count".}
proc ecs_vec_set_min_count_zeromem*(allocator: ptr struct_ecs_allocator_t;
                                    vec: ptr ecs_vec_t; size: ecs_size_t;
                                    elem_count: int32): void {.cdecl,
    importc: "ecs_vec_set_min_count_zeromem".}
proc ecs_vec_set_count*(allocator: ptr struct_ecs_allocator_t;
                        vec: ptr ecs_vec_t; size: ecs_size_t; elem_count: int32): void {.
    cdecl, importc: "ecs_vec_set_count".}
proc ecs_vec_set_count_w_type_info*(allocator: ptr struct_ecs_allocator_t;
                                    vec: ptr ecs_vec_t; size: ecs_size_t;
                                    elem_count: int32; ti: ptr ecs_type_info_t): void {.
    cdecl, importc: "ecs_vec_set_count_w_type_info".}
proc ecs_vec_set_min_count_w_type_info*(allocator: ptr struct_ecs_allocator_t;
                                        vec: ptr ecs_vec_t; size: ecs_size_t;
                                        elem_count: int32;
                                        ti: ptr ecs_type_info_t): void {.cdecl,
    importc: "ecs_vec_set_min_count_w_type_info".}
proc ecs_vec_grow*(allocator: ptr struct_ecs_allocator_t; vec: ptr ecs_vec_t;
                   size: ecs_size_t; elem_count: int32): pointer {.cdecl,
    importc: "ecs_vec_grow".}
proc ecs_vec_count*(vec: ptr ecs_vec_t): int32 {.cdecl, importc: "ecs_vec_count".}
proc ecs_vec_size*(vec: ptr ecs_vec_t): int32 {.cdecl, importc: "ecs_vec_size".}
proc ecs_vec_get*(vec: ptr ecs_vec_t; size: ecs_size_t; index: int32): pointer {.
    cdecl, importc: "ecs_vec_get".}
proc ecs_vec_first*(vec: ptr ecs_vec_t): pointer {.cdecl,
    importc: "ecs_vec_first".}
proc ecs_vec_last*(vec: ptr ecs_vec_t; size: ecs_size_t): pointer {.cdecl,
    importc: "ecs_vec_last".}
proc flecs_sparse_init*(result: ptr ecs_sparse_t;
                        allocator: ptr struct_ecs_allocator_t;
                        page_allocator: ptr struct_ecs_block_allocator_t;
                        size: ecs_size_t): void {.cdecl,
    importc: "flecs_sparse_init".}
proc flecs_sparse_fini*(sparse: ptr ecs_sparse_t): void {.cdecl,
    importc: "flecs_sparse_fini".}
proc flecs_sparse_clear*(sparse: ptr ecs_sparse_t): void {.cdecl,
    importc: "flecs_sparse_clear".}
proc flecs_sparse_add*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t): pointer {.
    cdecl, importc: "flecs_sparse_add".}
proc flecs_sparse_last_id*(sparse: ptr ecs_sparse_t): uint64 {.cdecl,
    importc: "flecs_sparse_last_id".}
proc flecs_sparse_new_id*(sparse: ptr ecs_sparse_t): uint64 {.cdecl,
    importc: "flecs_sparse_new_id".}
proc flecs_sparse_remove*(sparse: ptr ecs_sparse_t; size: ecs_size_t; id: uint64): bool {.
    cdecl, importc: "flecs_sparse_remove".}
proc flecs_sparse_remove_w_gen*(sparse: ptr ecs_sparse_t; size: ecs_size_t;
                                id: uint64): bool {.cdecl,
    importc: "flecs_sparse_remove_w_gen".}
proc flecs_sparse_is_alive*(sparse: ptr ecs_sparse_t; id: uint64): bool {.cdecl,
    importc: "flecs_sparse_is_alive".}
proc flecs_sparse_get_dense*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                             index: int32): pointer {.cdecl,
    importc: "flecs_sparse_get_dense".}
proc flecs_sparse_count*(sparse: ptr ecs_sparse_t): int32 {.cdecl,
    importc: "flecs_sparse_count".}
proc flecs_sparse_has*(sparse: ptr ecs_sparse_t; id: uint64): bool {.cdecl,
    importc: "flecs_sparse_has".}
proc flecs_sparse_get*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                       id: uint64): pointer {.cdecl, importc: "flecs_sparse_get".}
proc flecs_sparse_insert*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                          id: uint64): pointer {.cdecl,
    importc: "flecs_sparse_insert".}
proc flecs_sparse_ensure*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                          id: uint64; is_new: ptr bool): pointer {.cdecl,
    importc: "flecs_sparse_ensure".}
proc flecs_sparse_ensure_fast*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                               id: uint64): pointer {.cdecl,
    importc: "flecs_sparse_ensure_fast".}
proc flecs_sparse_ids*(sparse: ptr ecs_sparse_t): ptr uint64 {.cdecl,
    importc: "flecs_sparse_ids".}
proc flecs_sparse_shrink*(sparse: ptr ecs_sparse_t): void {.cdecl,
    importc: "flecs_sparse_shrink".}
proc ecs_sparse_init*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t): void {.
    cdecl, importc: "ecs_sparse_init".}
proc ecs_sparse_add*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t): pointer {.
    cdecl, importc: "ecs_sparse_add".}
proc ecs_sparse_last_id*(sparse: ptr ecs_sparse_t): uint64 {.cdecl,
    importc: "ecs_sparse_last_id".}
proc ecs_sparse_count*(sparse: ptr ecs_sparse_t): int32 {.cdecl,
    importc: "ecs_sparse_count".}
proc ecs_sparse_get_dense*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t;
                           index: int32): pointer {.cdecl,
    importc: "ecs_sparse_get_dense".}
proc ecs_sparse_get*(sparse: ptr ecs_sparse_t; elem_size: ecs_size_t; id: uint64): pointer {.
    cdecl, importc: "ecs_sparse_get".}
proc flecs_ballocator_init*(ba: ptr ecs_block_allocator_t; size: ecs_size_t): void {.
    cdecl, importc: "flecs_ballocator_init".}
proc flecs_ballocator_new*(size: ecs_size_t): ptr ecs_block_allocator_t {.cdecl,
    importc: "flecs_ballocator_new".}
proc flecs_ballocator_fini*(ba: ptr ecs_block_allocator_t): void {.cdecl,
    importc: "flecs_ballocator_fini".}
proc flecs_ballocator_free*(ba: ptr ecs_block_allocator_t): void {.cdecl,
    importc: "flecs_ballocator_free".}
proc flecs_balloc*(allocator: ptr ecs_block_allocator_t): pointer {.cdecl,
    importc: "flecs_balloc".}
proc flecs_balloc_w_dbg_info*(allocator: ptr ecs_block_allocator_t;
                              type_name: cstring): pointer {.cdecl,
    importc: "flecs_balloc_w_dbg_info".}
proc flecs_bcalloc*(allocator: ptr ecs_block_allocator_t): pointer {.cdecl,
    importc: "flecs_bcalloc".}
proc flecs_bcalloc_w_dbg_info*(allocator: ptr ecs_block_allocator_t;
                               type_name: cstring): pointer {.cdecl,
    importc: "flecs_bcalloc_w_dbg_info".}
proc flecs_bfree*(allocator: ptr ecs_block_allocator_t; memory: pointer): void {.
    cdecl, importc: "flecs_bfree".}
proc flecs_bfree_w_dbg_info*(allocator: ptr ecs_block_allocator_t;
                             memory: pointer; type_name: cstring): void {.cdecl,
    importc: "flecs_bfree_w_dbg_info".}
proc flecs_brealloc*(dst: ptr ecs_block_allocator_t;
                     src: ptr ecs_block_allocator_t; memory: pointer): pointer {.
    cdecl, importc: "flecs_brealloc".}
proc flecs_brealloc_w_dbg_info*(dst: ptr ecs_block_allocator_t;
                                src: ptr ecs_block_allocator_t; memory: pointer;
                                type_name: cstring): pointer {.cdecl,
    importc: "flecs_brealloc_w_dbg_info".}
proc flecs_bdup*(ba: ptr ecs_block_allocator_t; memory: pointer): pointer {.
    cdecl, importc: "flecs_bdup".}
proc flecs_stack_init*(stack: ptr ecs_stack_t): void {.cdecl,
    importc: "flecs_stack_init".}
proc flecs_stack_fini*(stack: ptr ecs_stack_t): void {.cdecl,
    importc: "flecs_stack_fini".}
proc flecs_stack_alloc*(stack: ptr ecs_stack_t; size: ecs_size_t;
                        align: ecs_size_t): pointer {.cdecl,
    importc: "flecs_stack_alloc".}
proc flecs_stack_calloc*(stack: ptr ecs_stack_t; size: ecs_size_t;
                         align: ecs_size_t): pointer {.cdecl,
    importc: "flecs_stack_calloc".}
proc flecs_stack_free*(ptr_arg: pointer; size: ecs_size_t): void {.cdecl,
    importc: "flecs_stack_free".}
proc flecs_stack_reset*(stack: ptr ecs_stack_t): void {.cdecl,
    importc: "flecs_stack_reset".}
proc flecs_stack_get_cursor*(stack: ptr ecs_stack_t): ptr ecs_stack_cursor_t {.
    cdecl, importc: "flecs_stack_get_cursor".}
proc flecs_stack_restore_cursor*(stack: ptr ecs_stack_t;
                                 cursor: ptr ecs_stack_cursor_t): void {.cdecl,
    importc: "flecs_stack_restore_cursor".}
proc ecs_map_init*(map: ptr ecs_map_t; allocator: ptr struct_ecs_allocator_t): void {.
    cdecl, importc: "ecs_map_init".}
proc ecs_map_init_if*(map: ptr ecs_map_t; allocator: ptr struct_ecs_allocator_t): void {.
    cdecl, importc: "ecs_map_init_if".}
proc ecs_map_reclaim*(map: ptr ecs_map_t): void {.cdecl,
    importc: "ecs_map_reclaim".}
proc ecs_map_fini*(map: ptr ecs_map_t): void {.cdecl, importc: "ecs_map_fini".}
proc ecs_map_get*(map: ptr ecs_map_t; key: ecs_map_key_t): ptr ecs_map_val_t {.
    cdecl, importc: "ecs_map_get".}
proc ecs_map_get_deref_private*(map: ptr ecs_map_t; key: ecs_map_key_t): pointer {.
    cdecl, importc: "ecs_map_get_deref_".}
proc ecs_map_ensure*(map: ptr ecs_map_t; key: ecs_map_key_t): ptr ecs_map_val_t {.
    cdecl, importc: "ecs_map_ensure".}
proc ecs_map_ensure_alloc*(map: ptr ecs_map_t; elem_size: ecs_size_t;
                           key: ecs_map_key_t): pointer {.cdecl,
    importc: "ecs_map_ensure_alloc".}
proc ecs_map_insert*(map: ptr ecs_map_t; key: ecs_map_key_t;
                     value: ecs_map_val_t): void {.cdecl,
    importc: "ecs_map_insert".}
proc ecs_map_insert_alloc*(map: ptr ecs_map_t; elem_size: ecs_size_t;
                           key: ecs_map_key_t): pointer {.cdecl,
    importc: "ecs_map_insert_alloc".}
proc ecs_map_remove*(map: ptr ecs_map_t; key: ecs_map_key_t): ecs_map_val_t {.
    cdecl, importc: "ecs_map_remove".}
proc ecs_map_remove_free*(map: ptr ecs_map_t; key: ecs_map_key_t): void {.cdecl,
    importc: "ecs_map_remove_free".}
proc ecs_map_clear*(map: ptr ecs_map_t): void {.cdecl, importc: "ecs_map_clear".}
proc ecs_map_iter*(map: ptr ecs_map_t): ecs_map_iter_t {.cdecl,
    importc: "ecs_map_iter".}
proc ecs_map_iter_valid*(iter: ptr ecs_map_iter_t): bool {.cdecl,
    importc: "ecs_map_iter_valid".}
proc ecs_map_next*(iter: ptr ecs_map_iter_t): bool {.cdecl,
    importc: "ecs_map_next".}
proc ecs_map_copy*(dst: ptr ecs_map_t; src: ptr ecs_map_t): void {.cdecl,
    importc: "ecs_map_copy".}
var ecs_block_allocator_alloc_count* {.importc: "ecs_block_allocator_alloc_count".}: int64
var ecs_block_allocator_free_count* {.importc: "ecs_block_allocator_free_count".}: int64
var ecs_stack_allocator_alloc_count* {.importc: "ecs_stack_allocator_alloc_count".}: int64
var ecs_stack_allocator_free_count* {.importc: "ecs_stack_allocator_free_count".}: int64
proc flecs_allocator_init*(a: ptr ecs_allocator_t): void {.cdecl,
    importc: "flecs_allocator_init".}
proc flecs_allocator_fini*(a: ptr ecs_allocator_t): void {.cdecl,
    importc: "flecs_allocator_fini".}
proc flecs_allocator_get*(a: ptr ecs_allocator_t; size: ecs_size_t): ptr ecs_block_allocator_t {.
    cdecl, importc: "flecs_allocator_get".}
proc flecs_strdup*(a: ptr ecs_allocator_t; str: cstring): cstring {.cdecl,
    importc: "flecs_strdup".}
proc flecs_strfree*(a: ptr ecs_allocator_t; str: cstring): void {.cdecl,
    importc: "flecs_strfree".}
proc flecs_dup*(a: ptr ecs_allocator_t; size: ecs_size_t; src: pointer): pointer {.
    cdecl, importc: "flecs_dup".}
proc ecs_strbuf_append*(buffer: ptr ecs_strbuf_t; fmt: cstring): void {.cdecl,
    varargs, importc: "ecs_strbuf_append".}
proc ecs_strbuf_vappend*(buffer: ptr ecs_strbuf_t; fmt: cstring): void {.cdecl,
    varargs, importc: "ecs_strbuf_vappend".}
proc ecs_strbuf_appendstr*(buffer: ptr ecs_strbuf_t; str: cstring): void {.
    cdecl, importc: "ecs_strbuf_appendstr".}
proc ecs_strbuf_appendch*(buffer: ptr ecs_strbuf_t; ch: cschar): void {.cdecl,
    importc: "ecs_strbuf_appendch".}
proc ecs_strbuf_appendint*(buffer: ptr ecs_strbuf_t; v: int64): void {.cdecl,
    importc: "ecs_strbuf_appendint".}
proc ecs_strbuf_appendflt*(buffer: ptr ecs_strbuf_t; v: cdouble;
                           nan_delim: cschar): void {.cdecl,
    importc: "ecs_strbuf_appendflt".}
proc ecs_strbuf_appendbool*(buffer: ptr ecs_strbuf_t; v: bool): void {.cdecl,
    importc: "ecs_strbuf_appendbool".}
proc ecs_strbuf_mergebuff*(dst_buffer: ptr ecs_strbuf_t;
                           src_buffer: ptr ecs_strbuf_t): void {.cdecl,
    importc: "ecs_strbuf_mergebuff".}
proc ecs_strbuf_appendstrn*(buffer: ptr ecs_strbuf_t; str: cstring; n: int32): void {.
    cdecl, importc: "ecs_strbuf_appendstrn".}
proc ecs_strbuf_get*(buffer: ptr ecs_strbuf_t): cstring {.cdecl,
    importc: "ecs_strbuf_get".}
proc ecs_strbuf_get_small*(buffer: ptr ecs_strbuf_t): cstring {.cdecl,
    importc: "ecs_strbuf_get_small".}
proc ecs_strbuf_reset*(buffer: ptr ecs_strbuf_t): void {.cdecl,
    importc: "ecs_strbuf_reset".}
proc ecs_strbuf_list_push*(buffer: ptr ecs_strbuf_t; list_open: cstring;
                           separator: cstring): void {.cdecl,
    importc: "ecs_strbuf_list_push".}
proc ecs_strbuf_list_pop*(buffer: ptr ecs_strbuf_t; list_close: cstring): void {.
    cdecl, importc: "ecs_strbuf_list_pop".}
proc ecs_strbuf_list_next*(buffer: ptr ecs_strbuf_t): void {.cdecl,
    importc: "ecs_strbuf_list_next".}
proc ecs_strbuf_list_appendch*(buffer: ptr ecs_strbuf_t; ch: cschar): void {.
    cdecl, importc: "ecs_strbuf_list_appendch".}
proc ecs_strbuf_list_append*(buffer: ptr ecs_strbuf_t; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_strbuf_list_append".}
proc ecs_strbuf_list_appendstr*(buffer: ptr ecs_strbuf_t; str: cstring): void {.
    cdecl, importc: "ecs_strbuf_list_appendstr".}
proc ecs_strbuf_list_appendstrn*(buffer: ptr ecs_strbuf_t; str: cstring;
                                 n: int32): void {.cdecl,
    importc: "ecs_strbuf_list_appendstrn".}
proc ecs_strbuf_written*(buffer: ptr ecs_strbuf_t): int32 {.cdecl,
    importc: "ecs_strbuf_written".}
var ecs_os_api_malloc_count* {.importc: "ecs_os_api_malloc_count".}: int64
var ecs_os_api_realloc_count* {.importc: "ecs_os_api_realloc_count".}: int64
var ecs_os_api_calloc_count* {.importc: "ecs_os_api_calloc_count".}: int64
var ecs_os_api_free_count* {.importc: "ecs_os_api_free_count".}: int64
var ecs_os_api* {.importc: "ecs_os_api".}: ecs_os_api_t
proc ecs_os_init*(): void {.cdecl, importc: "ecs_os_init".}
proc ecs_os_fini*(): void {.cdecl, importc: "ecs_os_fini".}
proc ecs_os_set_api*(os_api: ptr ecs_os_api_t): void {.cdecl,
    importc: "ecs_os_set_api".}
proc ecs_os_get_api*(): ecs_os_api_t {.cdecl, importc: "ecs_os_get_api".}
proc ecs_os_set_api_defaults*(): void {.cdecl,
                                        importc: "ecs_os_set_api_defaults".}
proc ecs_os_dbg*(file: cstring; line: int32; msg: cstring): void {.cdecl,
    importc: "ecs_os_dbg".}
proc ecs_os_trace*(file: cstring; line: int32; msg: cstring): void {.cdecl,
    importc: "ecs_os_trace".}
proc ecs_os_warn*(file: cstring; line: int32; msg: cstring): void {.cdecl,
    importc: "ecs_os_warn".}
proc ecs_os_err*(file: cstring; line: int32; msg: cstring): void {.cdecl,
    importc: "ecs_os_err".}
proc ecs_os_fatal*(file: cstring; line: int32; msg: cstring): void {.cdecl,
    importc: "ecs_os_fatal".}
proc ecs_os_strerror*(err: cint): cstring {.cdecl, importc: "ecs_os_strerror".}
proc ecs_os_strset*(str: ptr cstring; value: cstring): void {.cdecl,
    importc: "ecs_os_strset".}
proc ecs_os_perf_trace_push_private*(file: cstring; line: csize_t; name: cstring): void {.
    cdecl, importc: "ecs_os_perf_trace_push_".}
proc ecs_os_perf_trace_pop_private*(file: cstring; line: csize_t; name: cstring): void {.
    cdecl, importc: "ecs_os_perf_trace_pop_".}
proc ecs_sleepf*(t: cdouble): void {.cdecl, importc: "ecs_sleepf".}
proc ecs_time_measure*(start: ptr ecs_time_t): cdouble {.cdecl,
    importc: "ecs_time_measure".}
proc ecs_time_sub*(t1: ecs_time_t; t2: ecs_time_t): ecs_time_t {.cdecl,
    importc: "ecs_time_sub".}
proc ecs_time_to_double*(t: ecs_time_t): cdouble {.cdecl,
    importc: "ecs_time_to_double".}
proc ecs_os_memdup*(src: pointer; size: ecs_size_t): pointer {.cdecl,
    importc: "ecs_os_memdup".}
proc ecs_os_has_heap*(): bool {.cdecl, importc: "ecs_os_has_heap".}
proc ecs_os_has_threading*(): bool {.cdecl, importc: "ecs_os_has_threading".}
proc ecs_os_has_task_support*(): bool {.cdecl,
                                        importc: "ecs_os_has_task_support".}
proc ecs_os_has_time*(): bool {.cdecl, importc: "ecs_os_has_time".}
proc ecs_os_has_logging*(): bool {.cdecl, importc: "ecs_os_has_logging".}
proc ecs_os_has_dl*(): bool {.cdecl, importc: "ecs_os_has_dl".}
proc ecs_os_has_modules*(): bool {.cdecl, importc: "ecs_os_has_modules".}
proc flecs_module_path_from_c*(c_name: cstring): cstring {.cdecl,
    importc: "flecs_module_path_from_c".}
proc flecs_default_ctor*(ptr_arg: pointer; count: int32;
                         type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_default_ctor".}
proc flecs_type_info_ctor*(ptr_arg: pointer; count: int32;
                           type_info: ptr ecs_type_info_t): bool {.cdecl,
    importc: "flecs_type_info_ctor".}
proc flecs_type_info_dtor*(ptr_arg: pointer; count: int32;
                           type_info: ptr ecs_type_info_t): bool {.cdecl,
    importc: "flecs_type_info_dtor".}
proc flecs_type_info_copy*(dst: pointer; src: pointer; count: int32;
                           type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_type_info_copy".}
proc flecs_type_info_move*(dst: pointer; src: pointer; count: int32;
                           type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_type_info_move".}
proc flecs_type_info_copy_ctor*(dst: pointer; src: pointer; count: int32;
                                type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_type_info_copy_ctor".}
proc flecs_type_info_move_ctor*(dst: pointer; src: pointer; count: int32;
                                type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_type_info_move_ctor".}
proc flecs_type_info_ctor_move_dtor*(dst: pointer; src: pointer; count: int32;
                                     type_info: ptr ecs_type_info_t): void {.
    cdecl, importc: "flecs_type_info_ctor_move_dtor".}
proc flecs_type_info_move_dtor*(dst: pointer; src: pointer; count: int32;
                                type_info: ptr ecs_type_info_t): void {.cdecl,
    importc: "flecs_type_info_move_dtor".}
proc flecs_type_info_cmp*(a: pointer; b: pointer; type_info: ptr ecs_type_info_t): cint {.
    cdecl, importc: "flecs_type_info_cmp".}
proc flecs_type_info_equals*(a: pointer; b: pointer;
                             type_info: ptr ecs_type_info_t): bool {.cdecl,
    importc: "flecs_type_info_equals".}
proc flecs_vasprintf*(fmt: cstring): cstring {.cdecl, varargs,
    importc: "flecs_vasprintf".}
proc flecs_asprintf*(fmt: cstring): cstring {.cdecl, varargs,
    importc: "flecs_asprintf".}
proc flecs_chresc*(out_arg: cstring; in_arg: cschar; delimiter: cschar): cstring {.
    cdecl, importc: "flecs_chresc".}
proc flecs_chrparse*(in_arg: cstring; out_arg: cstring): cstring {.cdecl,
    importc: "flecs_chrparse".}
proc flecs_stresc*(out_arg: cstring; size: ecs_size_t; delimiter: cschar;
                   in_arg: cstring): ecs_size_t {.cdecl, importc: "flecs_stresc".}
proc flecs_astresc*(delimiter: cschar; in_arg: cstring): cstring {.cdecl,
    importc: "flecs_astresc".}
proc flecs_parse_ws_eol*(ptr_arg: cstring): cstring {.cdecl,
    importc: "flecs_parse_ws_eol".}
proc flecs_parse_digit*(ptr_arg: cstring; token: cstring): cstring {.cdecl,
    importc: "flecs_parse_digit".}
proc flecs_to_snake_case*(str: cstring): cstring {.cdecl,
    importc: "flecs_to_snake_case".}
proc flecs_suspend_readonly*(world: ptr ecs_world_t;
                             state: ptr ecs_suspend_readonly_state_t): ptr ecs_world_t {.
    cdecl, importc: "flecs_suspend_readonly".}
proc flecs_resume_readonly*(world: ptr ecs_world_t;
                            state: ptr ecs_suspend_readonly_state_t): void {.
    cdecl, importc: "flecs_resume_readonly".}
proc flecs_table_observed_count*(table: ptr ecs_table_t): int32 {.cdecl,
    importc: "flecs_table_observed_count".}
proc flecs_dump_backtrace*(stream: pointer): void {.cdecl,
    importc: "flecs_dump_backtrace".}
proc flecs_poly_claim_private*(poly: pointer): int32 {.cdecl,
    importc: "flecs_poly_claim_".}
proc flecs_poly_release_private*(poly: pointer): int32 {.cdecl,
    importc: "flecs_poly_release_".}
proc flecs_poly_refcount*(poly: pointer): int32 {.cdecl,
    importc: "flecs_poly_refcount".}
proc flecs_component_ids_index_get*(): int32 {.cdecl,
    importc: "flecs_component_ids_index_get".}
proc flecs_component_ids_get*(world: ptr ecs_world_t; index: int32): ecs_entity_t {.
    cdecl, importc: "flecs_component_ids_get".}
proc flecs_component_ids_get_alive*(world: ptr ecs_world_t; index: int32): ecs_entity_t {.
    cdecl, importc: "flecs_component_ids_get_alive".}
proc flecs_component_ids_set*(world: ptr ecs_world_t; index: int32;
                              id: ecs_entity_t): void {.cdecl,
    importc: "flecs_component_ids_set".}
proc flecs_query_trivial_cached_next*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "flecs_query_trivial_cached_next".}
proc flecs_check_exclusive_world_access_write*(world: ptr ecs_world_t): void {.
    cdecl, importc: "flecs_check_exclusive_world_access_write".}
proc flecs_check_exclusive_world_access_read*(world: ptr ecs_world_t): void {.
    cdecl, importc: "flecs_check_exclusive_world_access_read".}
proc flecs_defer_end*(world: ptr ecs_world_t; stage: ptr ecs_stage_t): bool {.
    cdecl, importc: "flecs_defer_end".}
proc flecs_hashmap_init_private*(hm: ptr ecs_hashmap_t; key_size: ecs_size_t;
                                 value_size: ecs_size_t;
                                 hash: ecs_hash_value_action_t;
                                 compare: ecs_compare_action_t;
                                 allocator: ptr ecs_allocator_t): void {.cdecl,
    importc: "flecs_hashmap_init_".}
proc flecs_hashmap_fini*(map: ptr ecs_hashmap_t): void {.cdecl,
    importc: "flecs_hashmap_fini".}
proc flecs_hashmap_get_private*(map: ptr ecs_hashmap_t; key_size: ecs_size_t;
                                key: pointer; value_size: ecs_size_t): pointer {.
    cdecl, importc: "flecs_hashmap_get_".}
proc flecs_hashmap_ensure_private*(map: ptr ecs_hashmap_t; key_size: ecs_size_t;
                                   key: pointer; value_size: ecs_size_t): flecs_hashmap_result_t {.
    cdecl, importc: "flecs_hashmap_ensure_".}
proc flecs_hashmap_set_private*(map: ptr ecs_hashmap_t; key_size: ecs_size_t;
                                key: pointer; value_size: ecs_size_t;
                                value: pointer): void {.cdecl,
    importc: "flecs_hashmap_set_".}
proc flecs_hashmap_remove_private*(map: ptr ecs_hashmap_t; key_size: ecs_size_t;
                                   key: pointer; value_size: ecs_size_t): void {.
    cdecl, importc: "flecs_hashmap_remove_".}
proc flecs_hashmap_remove_w_hash_private*(map: ptr ecs_hashmap_t;
    key_size: ecs_size_t; key: pointer; value_size: ecs_size_t; hash: uint64): void {.
    cdecl, importc: "flecs_hashmap_remove_w_hash_".}
proc flecs_hashmap_get_bucket*(map: ptr ecs_hashmap_t; hash: uint64): ptr ecs_hm_bucket_t {.
    cdecl, importc: "flecs_hashmap_get_bucket".}
proc flecs_hm_bucket_remove*(map: ptr ecs_hashmap_t;
                             bucket: ptr ecs_hm_bucket_t; hash: uint64;
                             index: int32): void {.cdecl,
    importc: "flecs_hm_bucket_remove".}
proc flecs_hashmap_copy*(dst: ptr ecs_hashmap_t; src: ptr ecs_hashmap_t): void {.
    cdecl, importc: "flecs_hashmap_copy".}
proc flecs_hashmap_iter*(map: ptr ecs_hashmap_t): flecs_hashmap_iter_t {.cdecl,
    importc: "flecs_hashmap_iter".}
proc flecs_hashmap_next_private*(it: ptr flecs_hashmap_iter_t;
                                 key_size: ecs_size_t; key_out: pointer;
                                 value_size: ecs_size_t): pointer {.cdecl,
    importc: "flecs_hashmap_next_".}
proc ecs_record_find*(world: ptr ecs_world_t; entity: ecs_entity_t): ptr ecs_record_t {.
    cdecl, importc: "ecs_record_find".}
proc ecs_record_get_entity*(record: ptr ecs_record_t): ecs_entity_t {.cdecl,
    importc: "ecs_record_get_entity".}
proc ecs_write_begin*(world: ptr ecs_world_t; entity: ecs_entity_t): ptr ecs_record_t {.
    cdecl, importc: "ecs_write_begin".}
proc ecs_write_end*(record: ptr ecs_record_t): void {.cdecl,
    importc: "ecs_write_end".}
proc ecs_read_begin*(world: ptr ecs_world_t; entity: ecs_entity_t): ptr ecs_record_t {.
    cdecl, importc: "ecs_read_begin".}
proc ecs_read_end*(record: ptr ecs_record_t): void {.cdecl,
    importc: "ecs_read_end".}
proc ecs_record_get_id*(world: ptr ecs_world_t; record: ptr ecs_record_t;
                        id: ecs_id_t): pointer {.cdecl,
    importc: "ecs_record_get_id".}
proc ecs_record_ensure_id*(world: ptr ecs_world_t; record: ptr ecs_record_t;
                           id: ecs_id_t): pointer {.cdecl,
    importc: "ecs_record_ensure_id".}
proc ecs_record_has_id*(world: ptr ecs_world_t; record: ptr ecs_record_t;
                        id: ecs_id_t): bool {.cdecl,
    importc: "ecs_record_has_id".}
proc ecs_record_get_by_column*(record: ptr ecs_record_t; column: int32;
                               size: csize_t): pointer {.cdecl,
    importc: "ecs_record_get_by_column".}
proc flecs_components_get*(world: ptr ecs_world_t; id: ecs_id_t): ptr ecs_component_record_t {.
    cdecl, importc: "flecs_components_get".}
proc flecs_components_ensure*(world: ptr ecs_world_t; id: ecs_id_t): ptr ecs_component_record_t {.
    cdecl, importc: "flecs_components_ensure".}
proc flecs_component_get_id*(cr: ptr ecs_component_record_t): ecs_id_t {.cdecl,
    importc: "flecs_component_get_id".}
proc flecs_component_get_flags*(world: ptr ecs_world_t; id: ecs_id_t): ecs_flags32_t {.
    cdecl, importc: "flecs_component_get_flags".}
proc flecs_component_get_type_info*(cr: ptr ecs_component_record_t): ptr ecs_type_info_t {.
    cdecl, importc: "flecs_component_get_type_info".}
proc flecs_component_get_table*(cr: ptr ecs_component_record_t;
                                table: ptr ecs_table_t): ptr ecs_table_record_t {.
    cdecl, importc: "flecs_component_get_table".}
proc flecs_component_get_parent_record*(cr: ptr ecs_component_record_t;
                                        table: ptr ecs_table_t): ptr ecs_parent_record_t {.
    cdecl, importc: "flecs_component_get_parent_record".}
proc flecs_component_get_childof_depth*(cr: ptr ecs_component_record_t): int32 {.
    cdecl, importc: "flecs_component_get_childof_depth".}
proc flecs_component_iter*(cr: ptr ecs_component_record_t;
                           iter_out: ptr ecs_table_cache_iter_t): bool {.cdecl,
    importc: "flecs_component_iter".}
proc flecs_component_next*(iter: ptr ecs_table_cache_iter_t): ptr ecs_table_record_t {.
    cdecl, importc: "flecs_component_next".}
proc flecs_table_records*(table: ptr ecs_table_t): ecs_table_records_t {.cdecl,
    importc: "flecs_table_records".}
proc flecs_table_record_get_component*(tr: ptr ecs_table_record_t): ptr ecs_component_record_t {.
    cdecl, importc: "flecs_table_record_get_component".}
proc flecs_table_id*(table: ptr ecs_table_t): uint64 {.cdecl,
    importc: "flecs_table_id".}
proc flecs_table_traverse_add*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                               id_ptr: ptr ecs_id_t; diff: ptr ecs_table_diff_t): ptr ecs_table_t {.
    cdecl, importc: "flecs_table_traverse_add".}
var ECS_PAIR* {.importc: "ECS_PAIR".}: ecs_id_t
var ECS_AUTO_OVERRIDE* {.importc: "ECS_AUTO_OVERRIDE".}: ecs_id_t
var ECS_TOGGLE* {.importc: "ECS_TOGGLE".}: ecs_id_t
var ECS_VALUE_PAIR* {.importc: "ECS_VALUE_PAIR".}: ecs_id_t
var FLECS_IDEcsComponentID_private* {.importc: "FLECS_IDEcsComponentID_".}: ecs_entity_t
var FLECS_IDEcsIdentifierID_private* {.importc: "FLECS_IDEcsIdentifierID_".}: ecs_entity_t
var FLECS_IDEcsPolyID_private* {.importc: "FLECS_IDEcsPolyID_".}: ecs_entity_t
var FLECS_IDEcsParentID_private* {.importc: "FLECS_IDEcsParentID_".}: ecs_entity_t
var FLECS_IDEcsTreeSpawnerID_private* {.importc: "FLECS_IDEcsTreeSpawnerID_".}: ecs_entity_t
var FLECS_IDEcsDefaultChildComponentID_private*
    {.importc: "FLECS_IDEcsDefaultChildComponentID_".}: ecs_entity_t
var EcsParentDepth* {.importc: "EcsParentDepth".}: ecs_entity_t
var EcsQuery* {.importc: "EcsQuery".}: ecs_entity_t
var EcsObserver* {.importc: "EcsObserver".}: ecs_entity_t
var EcsSystem* {.importc: "EcsSystem".}: ecs_entity_t
var FLECS_IDEcsTickSourceID_private* {.importc: "FLECS_IDEcsTickSourceID_".}: ecs_entity_t
var FLECS_IDEcsPipelineQueryID_private* {.importc: "FLECS_IDEcsPipelineQueryID_".}: ecs_entity_t
var FLECS_IDEcsTimerID_private* {.importc: "FLECS_IDEcsTimerID_".}: ecs_entity_t
var FLECS_IDEcsRateFilterID_private* {.importc: "FLECS_IDEcsRateFilterID_".}: ecs_entity_t
var EcsFlecs* {.importc: "EcsFlecs".}: ecs_entity_t
var EcsFlecsCore* {.importc: "EcsFlecsCore".}: ecs_entity_t
var EcsWorld* {.importc: "EcsWorld".}: ecs_entity_t
var EcsWildcard* {.importc: "EcsWildcard".}: ecs_entity_t
var EcsAny* {.importc: "EcsAny".}: ecs_entity_t
var EcsThis* {.importc: "EcsThis".}: ecs_entity_t
var EcsVariable* {.importc: "EcsVariable".}: ecs_entity_t
var EcsTransitive* {.importc: "EcsTransitive".}: ecs_entity_t
var EcsReflexive* {.importc: "EcsReflexive".}: ecs_entity_t
var EcsFinal* {.importc: "EcsFinal".}: ecs_entity_t
var EcsInheritable* {.importc: "EcsInheritable".}: ecs_entity_t
var EcsOnInstantiate* {.importc: "EcsOnInstantiate".}: ecs_entity_t
var EcsOverride* {.importc: "EcsOverride".}: ecs_entity_t
var EcsInherit* {.importc: "EcsInherit".}: ecs_entity_t
var EcsDontInherit* {.importc: "EcsDontInherit".}: ecs_entity_t
var EcsSymmetric* {.importc: "EcsSymmetric".}: ecs_entity_t
var EcsExclusive* {.importc: "EcsExclusive".}: ecs_entity_t
var EcsAcyclic* {.importc: "EcsAcyclic".}: ecs_entity_t
var EcsTraversable* {.importc: "EcsTraversable".}: ecs_entity_t
var EcsWith* {.importc: "EcsWith".}: ecs_entity_t
var EcsOneOf* {.importc: "EcsOneOf".}: ecs_entity_t
var EcsCanToggle* {.importc: "EcsCanToggle".}: ecs_entity_t
var EcsTrait* {.importc: "EcsTrait".}: ecs_entity_t
var EcsRelationship* {.importc: "EcsRelationship".}: ecs_entity_t
var EcsTarget* {.importc: "EcsTarget".}: ecs_entity_t
var EcsPairIsTag* {.importc: "EcsPairIsTag".}: ecs_entity_t
var EcsName* {.importc: "EcsName".}: ecs_entity_t
var EcsSymbol* {.importc: "EcsSymbol".}: ecs_entity_t
var EcsAlias* {.importc: "EcsAlias".}: ecs_entity_t
var EcsChildOf* {.importc: "EcsChildOf".}: ecs_entity_t
var EcsIsA* {.importc: "EcsIsA".}: ecs_entity_t
var EcsDependsOn* {.importc: "EcsDependsOn".}: ecs_entity_t
var EcsSlotOf* {.importc: "EcsSlotOf".}: ecs_entity_t
var EcsOrderedChildren* {.importc: "EcsOrderedChildren".}: ecs_entity_t
var EcsModule* {.importc: "EcsModule".}: ecs_entity_t
var EcsPrefab* {.importc: "EcsPrefab".}: ecs_entity_t
var EcsDisabled* {.importc: "EcsDisabled".}: ecs_entity_t
var EcsNotQueryable* {.importc: "EcsNotQueryable".}: ecs_entity_t
var EcsOnAdd* {.importc: "EcsOnAdd".}: ecs_entity_t
var EcsOnRemove* {.importc: "EcsOnRemove".}: ecs_entity_t
var EcsOnSet* {.importc: "EcsOnSet".}: ecs_entity_t
var EcsMonitor* {.importc: "EcsMonitor".}: ecs_entity_t
var EcsOnTableCreate* {.importc: "EcsOnTableCreate".}: ecs_entity_t
var EcsOnTableDelete* {.importc: "EcsOnTableDelete".}: ecs_entity_t
var EcsOnDelete* {.importc: "EcsOnDelete".}: ecs_entity_t
var EcsOnDeleteTarget* {.importc: "EcsOnDeleteTarget".}: ecs_entity_t
var EcsRemove* {.importc: "EcsRemove".}: ecs_entity_t
var EcsDelete* {.importc: "EcsDelete".}: ecs_entity_t
var EcsPanic* {.importc: "EcsPanic".}: ecs_entity_t
var EcsSingleton* {.importc: "EcsSingleton".}: ecs_entity_t
var EcsSparse* {.importc: "EcsSparse".}: ecs_entity_t
var EcsDontFragment* {.importc: "EcsDontFragment".}: ecs_entity_t
var EcsPredEq* {.importc: "EcsPredEq".}: ecs_entity_t
var EcsPredMatch* {.importc: "EcsPredMatch".}: ecs_entity_t
var EcsPredLookup* {.importc: "EcsPredLookup".}: ecs_entity_t
var EcsScopeOpen* {.importc: "EcsScopeOpen".}: ecs_entity_t
var EcsScopeClose* {.importc: "EcsScopeClose".}: ecs_entity_t
var EcsEmpty* {.importc: "EcsEmpty".}: ecs_entity_t
var FLECS_IDEcsPipelineID_private* {.importc: "FLECS_IDEcsPipelineID_".}: ecs_entity_t
var EcsOnStart* {.importc: "EcsOnStart".}: ecs_entity_t
var EcsPreFrame* {.importc: "EcsPreFrame".}: ecs_entity_t
var EcsOnLoad* {.importc: "EcsOnLoad".}: ecs_entity_t
var EcsPostLoad* {.importc: "EcsPostLoad".}: ecs_entity_t
var EcsPreUpdate* {.importc: "EcsPreUpdate".}: ecs_entity_t
var EcsOnUpdate* {.importc: "EcsOnUpdate".}: ecs_entity_t
var EcsOnValidate* {.importc: "EcsOnValidate".}: ecs_entity_t
var EcsPostUpdate* {.importc: "EcsPostUpdate".}: ecs_entity_t
var EcsPreStore* {.importc: "EcsPreStore".}: ecs_entity_t
var EcsOnStore* {.importc: "EcsOnStore".}: ecs_entity_t
var EcsPostFrame* {.importc: "EcsPostFrame".}: ecs_entity_t
var EcsPhase* {.importc: "EcsPhase".}: ecs_entity_t
var EcsConstant* {.importc: "EcsConstant".}: ecs_entity_t
proc ecs_init*(): ptr ecs_world_t {.cdecl, importc: "ecs_init".}
proc ecs_mini*(): ptr ecs_world_t {.cdecl, importc: "ecs_mini".}
proc ecs_init_w_args*(argc: cint; argv: ptr UncheckedArray[cstring]): ptr ecs_world_t {.
    cdecl, importc: "ecs_init_w_args".}
proc ecs_fini*(world: ptr ecs_world_t): cint {.cdecl, importc: "ecs_fini".}
proc ecs_is_fini*(world: ptr ecs_world_t): bool {.cdecl, importc: "ecs_is_fini".}
proc ecs_atfini*(world: ptr ecs_world_t; action: ecs_fini_action_t; ctx: pointer): void {.
    cdecl, importc: "ecs_atfini".}
proc ecs_get_entities*(world: ptr ecs_world_t): ecs_entities_t {.cdecl,
    importc: "ecs_get_entities".}
proc ecs_world_get_flags*(world: ptr ecs_world_t): ecs_flags32_t {.cdecl,
    importc: "ecs_world_get_flags".}
proc ecs_frame_begin*(world: ptr ecs_world_t; delta_time: cfloat): cfloat {.
    cdecl, importc: "ecs_frame_begin".}
proc ecs_frame_end*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_frame_end".}
proc ecs_run_post_frame*(world: ptr ecs_world_t; action: ecs_fini_action_t;
                         ctx: pointer): void {.cdecl,
    importc: "ecs_run_post_frame".}
proc ecs_quit*(world: ptr ecs_world_t): void {.cdecl, importc: "ecs_quit".}
proc ecs_should_quit*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_should_quit".}
proc ecs_measure_frame_time*(world: ptr ecs_world_t; enable: bool): void {.
    cdecl, importc: "ecs_measure_frame_time".}
proc ecs_measure_system_time*(world: ptr ecs_world_t; enable: bool): void {.
    cdecl, importc: "ecs_measure_system_time".}
proc ecs_set_target_fps*(world: ptr ecs_world_t; fps: cfloat): void {.cdecl,
    importc: "ecs_set_target_fps".}
proc ecs_set_default_query_flags*(world: ptr ecs_world_t; flags: ecs_flags32_t): void {.
    cdecl, importc: "ecs_set_default_query_flags".}
proc ecs_readonly_begin*(world: ptr ecs_world_t; multi_threaded: bool): bool {.
    cdecl, importc: "ecs_readonly_begin".}
proc ecs_readonly_end*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_readonly_end".}
proc ecs_merge*(stage: ptr ecs_world_t): void {.cdecl, importc: "ecs_merge".}
proc ecs_defer_begin*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_defer_begin".}
proc ecs_defer_end*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_defer_end".}
proc ecs_defer_suspend*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_defer_suspend".}
proc ecs_defer_resume*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_defer_resume".}
proc ecs_is_deferred*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_is_deferred".}
proc ecs_is_defer_suspended*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_is_defer_suspended".}
proc ecs_set_stage_count*(world: ptr ecs_world_t; stages: int32): void {.cdecl,
    importc: "ecs_set_stage_count".}
proc ecs_get_stage_count*(world: ptr ecs_world_t): int32 {.cdecl,
    importc: "ecs_get_stage_count".}
proc ecs_get_stage*(world: ptr ecs_world_t; stage_id: int32): ptr ecs_world_t {.
    cdecl, importc: "ecs_get_stage".}
proc ecs_stage_is_readonly*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_stage_is_readonly".}
proc ecs_stage_new*(world: ptr ecs_world_t): ptr ecs_world_t {.cdecl,
    importc: "ecs_stage_new".}
proc ecs_stage_free*(stage: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_stage_free".}
proc ecs_stage_get_id*(world: ptr ecs_world_t): int32 {.cdecl,
    importc: "ecs_stage_get_id".}
proc ecs_set_ctx*(world: ptr ecs_world_t; ctx: pointer; ctx_free: ecs_ctx_free_t): void {.
    cdecl, importc: "ecs_set_ctx".}
proc ecs_set_binding_ctx*(world: ptr ecs_world_t; ctx: pointer;
                          ctx_free: ecs_ctx_free_t): void {.cdecl,
    importc: "ecs_set_binding_ctx".}
proc ecs_get_ctx*(world: ptr ecs_world_t): pointer {.cdecl,
    importc: "ecs_get_ctx".}
proc ecs_get_binding_ctx*(world: ptr ecs_world_t): pointer {.cdecl,
    importc: "ecs_get_binding_ctx".}
proc ecs_get_build_info*(): ptr ecs_build_info_t {.cdecl,
    importc: "ecs_get_build_info".}
proc ecs_get_world_info*(world: ptr ecs_world_t): ptr ecs_world_info_t {.cdecl,
    importc: "ecs_get_world_info".}
proc ecs_dim*(world: ptr ecs_world_t; entity_count: int32): void {.cdecl,
    importc: "ecs_dim".}
proc ecs_shrink*(world: ptr ecs_world_t): void {.cdecl, importc: "ecs_shrink".}
proc ecs_set_entity_range*(world: ptr ecs_world_t; id_start: ecs_entity_t;
                           id_end: ecs_entity_t): void {.cdecl,
    importc: "ecs_set_entity_range".}
proc ecs_enable_range_check*(world: ptr ecs_world_t; enable: bool): bool {.
    cdecl, importc: "ecs_enable_range_check".}
proc ecs_get_max_id*(world: ptr ecs_world_t): ecs_entity_t {.cdecl,
    importc: "ecs_get_max_id".}
proc ecs_run_aperiodic*(world: ptr ecs_world_t; flags: ecs_flags32_t): void {.
    cdecl, importc: "ecs_run_aperiodic".}
proc ecs_delete_empty_tables*(world: ptr ecs_world_t;
                              desc: ptr ecs_delete_empty_tables_desc_t): int32 {.
    cdecl, importc: "ecs_delete_empty_tables".}
proc ecs_get_world*(poly: pointer): ptr ecs_world_t {.cdecl,
    importc: "ecs_get_world".}
proc ecs_get_entity*(poly: pointer): ecs_entity_t {.cdecl,
    importc: "ecs_get_entity".}
proc flecs_poly_is_private*(object_arg: pointer; type_arg: int32): bool {.cdecl,
    importc: "flecs_poly_is_".}
proc ecs_make_pair*(first: ecs_entity_t; second: ecs_entity_t): ecs_id_t {.
    cdecl, importc: "ecs_make_pair".}
proc ecs_exclusive_access_begin*(world: ptr ecs_world_t; thread_name: cstring): void {.
    cdecl, importc: "ecs_exclusive_access_begin".}
proc ecs_exclusive_access_end*(world: ptr ecs_world_t; lock_world: bool): void {.
    cdecl, importc: "ecs_exclusive_access_end".}
proc ecs_new*(world: ptr ecs_world_t): ecs_entity_t {.cdecl, importc: "ecs_new".}
proc ecs_new_low_id*(world: ptr ecs_world_t): ecs_entity_t {.cdecl,
    importc: "ecs_new_low_id".}
proc ecs_new_w_id*(world: ptr ecs_world_t; component: ecs_id_t): ecs_entity_t {.
    cdecl, importc: "ecs_new_w_id".}
proc ecs_new_w_table*(world: ptr ecs_world_t; table: ptr ecs_table_t): ecs_entity_t {.
    cdecl, importc: "ecs_new_w_table".}
proc ecs_entity_init*(world: ptr ecs_world_t; desc: ptr ecs_entity_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_entity_init".}
proc ecs_bulk_init*(world: ptr ecs_world_t; desc: ptr ecs_bulk_desc_t): ptr ecs_entity_t {.
    cdecl, importc: "ecs_bulk_init".}
proc ecs_bulk_new_w_id*(world: ptr ecs_world_t; component: ecs_id_t;
                        count: int32): ptr ecs_entity_t {.cdecl,
    importc: "ecs_bulk_new_w_id".}
proc ecs_clone*(world: ptr ecs_world_t; dst: ecs_entity_t; src: ecs_entity_t;
                copy_value: bool): ecs_entity_t {.cdecl, importc: "ecs_clone".}
proc ecs_delete*(world: ptr ecs_world_t; entity: ecs_entity_t): void {.cdecl,
    importc: "ecs_delete".}
proc ecs_delete_with*(world: ptr ecs_world_t; component: ecs_id_t): void {.
    cdecl, importc: "ecs_delete_with".}
proc ecs_set_child_order*(world: ptr ecs_world_t; parent: ecs_entity_t;
                          children: ptr ecs_entity_t; child_count: int32): void {.
    cdecl, importc: "ecs_set_child_order".}
proc ecs_get_ordered_children*(world: ptr ecs_world_t; parent: ecs_entity_t): ecs_entities_t {.
    cdecl, importc: "ecs_get_ordered_children".}
proc ecs_add_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                 component: ecs_id_t): void {.cdecl, importc: "ecs_add_id".}
proc ecs_remove_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                    component: ecs_id_t): void {.cdecl, importc: "ecs_remove_id".}
proc ecs_auto_override_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                           component: ecs_id_t): void {.cdecl,
    importc: "ecs_auto_override_id".}
proc ecs_clear*(world: ptr ecs_world_t; entity: ecs_entity_t): void {.cdecl,
    importc: "ecs_clear".}
proc ecs_remove_all*(world: ptr ecs_world_t; component: ecs_id_t): void {.cdecl,
    importc: "ecs_remove_all".}
proc ecs_set_with*(world: ptr ecs_world_t; component: ecs_id_t): ecs_entity_t {.
    cdecl, importc: "ecs_set_with".}
proc ecs_get_with*(world: ptr ecs_world_t): ecs_id_t {.cdecl,
    importc: "ecs_get_with".}
proc ecs_enable*(world: ptr ecs_world_t; entity: ecs_entity_t; enabled: bool): void {.
    cdecl, importc: "ecs_enable".}
proc ecs_enable_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                    component: ecs_id_t; enable: bool): void {.cdecl,
    importc: "ecs_enable_id".}
proc ecs_is_enabled_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                        component: ecs_id_t): bool {.cdecl,
    importc: "ecs_is_enabled_id".}
proc ecs_get_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                 component: ecs_id_t): pointer {.cdecl, importc: "ecs_get_id".}
proc ecs_get_mut_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     component: ecs_id_t): pointer {.cdecl,
    importc: "ecs_get_mut_id".}
proc ecs_ensure_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                    component: ecs_id_t; size: csize_t): pointer {.cdecl,
    importc: "ecs_ensure_id".}
proc ecs_ref_init_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                      component: ecs_id_t): ecs_ref_t {.cdecl,
    importc: "ecs_ref_init_id".}
proc ecs_ref_get_id*(world: ptr ecs_world_t; ref_arg: ptr ecs_ref_t;
                     component: ecs_id_t): pointer {.cdecl,
    importc: "ecs_ref_get_id".}
proc ecs_ref_update*(world: ptr ecs_world_t; ref_arg: ptr ecs_ref_t): void {.
    cdecl, importc: "ecs_ref_update".}
proc ecs_emplace_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     component: ecs_id_t; size: csize_t; is_new: ptr bool): pointer {.
    cdecl, importc: "ecs_emplace_id".}
proc ecs_modified_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                      component: ecs_id_t): void {.cdecl,
    importc: "ecs_modified_id".}
proc ecs_set_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                 component: ecs_id_t; size: csize_t; ptr_arg: pointer): void {.
    cdecl, importc: "ecs_set_id".}
proc ecs_is_valid*(world: ptr ecs_world_t; e: ecs_entity_t): bool {.cdecl,
    importc: "ecs_is_valid".}
proc ecs_is_alive*(world: ptr ecs_world_t; e: ecs_entity_t): bool {.cdecl,
    importc: "ecs_is_alive".}
proc ecs_strip_generation*(e: ecs_entity_t): ecs_id_t {.cdecl,
    importc: "ecs_strip_generation".}
proc ecs_get_alive*(world: ptr ecs_world_t; e: ecs_entity_t): ecs_entity_t {.
    cdecl, importc: "ecs_get_alive".}
proc ecs_make_alive*(world: ptr ecs_world_t; entity: ecs_entity_t): void {.
    cdecl, importc: "ecs_make_alive".}
proc ecs_make_alive_id*(world: ptr ecs_world_t; component: ecs_id_t): void {.
    cdecl, importc: "ecs_make_alive_id".}
proc ecs_exists*(world: ptr ecs_world_t; entity: ecs_entity_t): bool {.cdecl,
    importc: "ecs_exists".}
proc ecs_set_version*(world: ptr ecs_world_t; entity: ecs_entity_t): void {.
    cdecl, importc: "ecs_set_version".}
proc ecs_get_version*(entity: ecs_entity_t): uint32 {.cdecl,
    importc: "ecs_get_version".}
proc ecs_get_type*(world: ptr ecs_world_t; entity: ecs_entity_t): ptr ecs_type_t {.
    cdecl, importc: "ecs_get_type".}
proc ecs_get_table*(world: ptr ecs_world_t; entity: ecs_entity_t): ptr ecs_table_t {.
    cdecl, importc: "ecs_get_table".}
proc ecs_type_str*(world: ptr ecs_world_t; type_arg: ptr ecs_type_t): cstring {.
    cdecl, importc: "ecs_type_str".}
proc ecs_table_str*(world: ptr ecs_world_t; table: ptr ecs_table_t): cstring {.
    cdecl, importc: "ecs_table_str".}
proc ecs_entity_str*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_entity_str".}
proc ecs_has_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                 component: ecs_id_t): bool {.cdecl, importc: "ecs_has_id".}
proc ecs_owns_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                  component: ecs_id_t): bool {.cdecl, importc: "ecs_owns_id".}
proc ecs_get_target*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     rel: ecs_entity_t; index: int32): ecs_entity_t {.cdecl,
    importc: "ecs_get_target".}
proc ecs_get_parent*(world: ptr ecs_world_t; entity: ecs_entity_t): ecs_entity_t {.
    cdecl, importc: "ecs_get_parent".}
proc ecs_new_w_parent*(world: ptr ecs_world_t; parent: ecs_entity_t;
                       name: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_new_w_parent".}
proc ecs_get_target_for_id*(world: ptr ecs_world_t; entity: ecs_entity_t;
                            rel: ecs_entity_t; component: ecs_id_t): ecs_entity_t {.
    cdecl, importc: "ecs_get_target_for_id".}
proc ecs_get_depth*(world: ptr ecs_world_t; entity: ecs_entity_t;
                    rel: ecs_entity_t): int32 {.cdecl, importc: "ecs_get_depth".}
proc ecs_count_id*(world: ptr ecs_world_t; entity: ecs_id_t): int32 {.cdecl,
    importc: "ecs_count_id".}
proc ecs_get_name*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_get_name".}
proc ecs_get_symbol*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_get_symbol".}
proc ecs_set_name*(world: ptr ecs_world_t; entity: ecs_entity_t; name: cstring): ecs_entity_t {.
    cdecl, importc: "ecs_set_name".}
proc ecs_set_symbol*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     symbol: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_set_symbol".}
proc ecs_set_alias*(world: ptr ecs_world_t; entity: ecs_entity_t; alias: cstring): void {.
    cdecl, importc: "ecs_set_alias".}
proc ecs_lookup*(world: ptr ecs_world_t; path: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_lookup".}
proc ecs_lookup_child*(world: ptr ecs_world_t; parent: ecs_entity_t;
                       name: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_lookup_child".}
proc ecs_lookup_path_w_sep*(world: ptr ecs_world_t; parent: ecs_entity_t;
                            path: cstring; sep: cstring; prefix: cstring;
                            recursive: bool): ecs_entity_t {.cdecl,
    importc: "ecs_lookup_path_w_sep".}
proc ecs_lookup_symbol*(world: ptr ecs_world_t; symbol: cstring;
                        lookup_as_path: bool; recursive: bool): ecs_entity_t {.
    cdecl, importc: "ecs_lookup_symbol".}
proc ecs_get_path_w_sep*(world: ptr ecs_world_t; parent: ecs_entity_t;
                         child: ecs_entity_t; sep: cstring; prefix: cstring): cstring {.
    cdecl, importc: "ecs_get_path_w_sep".}
proc ecs_get_path_w_sep_buf*(world: ptr ecs_world_t; parent: ecs_entity_t;
                             child: ecs_entity_t; sep: cstring; prefix: cstring;
                             buf: ptr ecs_strbuf_t; escape: bool): void {.cdecl,
    importc: "ecs_get_path_w_sep_buf".}
proc ecs_new_from_path_w_sep*(world: ptr ecs_world_t; parent: ecs_entity_t;
                              path: cstring; sep: cstring; prefix: cstring): ecs_entity_t {.
    cdecl, importc: "ecs_new_from_path_w_sep".}
proc ecs_add_path_w_sep*(world: ptr ecs_world_t; entity: ecs_entity_t;
                         parent: ecs_entity_t; path: cstring; sep: cstring;
                         prefix: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_add_path_w_sep".}
proc ecs_set_scope*(world: ptr ecs_world_t; scope: ecs_entity_t): ecs_entity_t {.
    cdecl, importc: "ecs_set_scope".}
proc ecs_get_scope*(world: ptr ecs_world_t): ecs_entity_t {.cdecl,
    importc: "ecs_get_scope".}
proc ecs_set_name_prefix*(world: ptr ecs_world_t; prefix: cstring): cstring {.
    cdecl, importc: "ecs_set_name_prefix".}
proc ecs_set_lookup_path*(world: ptr ecs_world_t; lookup_path: ptr ecs_entity_t): ptr ecs_entity_t {.
    cdecl, importc: "ecs_set_lookup_path".}
proc ecs_get_lookup_path*(world: ptr ecs_world_t): ptr ecs_entity_t {.cdecl,
    importc: "ecs_get_lookup_path".}
proc ecs_component_init*(world: ptr ecs_world_t; desc: ptr ecs_component_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_component_init".}
proc ecs_get_type_info*(world: ptr ecs_world_t; component: ecs_id_t): ptr ecs_type_info_t {.
    cdecl, importc: "ecs_get_type_info".}
proc ecs_set_hooks_id*(world: ptr ecs_world_t; component: ecs_entity_t;
                       hooks: ptr ecs_type_hooks_t): void {.cdecl,
    importc: "ecs_set_hooks_id".}
proc ecs_get_hooks_id*(world: ptr ecs_world_t; component: ecs_entity_t): ptr ecs_type_hooks_t {.
    cdecl, importc: "ecs_get_hooks_id".}
proc ecs_id_is_tag*(world: ptr ecs_world_t; component: ecs_id_t): bool {.cdecl,
    importc: "ecs_id_is_tag".}
proc ecs_id_in_use*(world: ptr ecs_world_t; component: ecs_id_t): bool {.cdecl,
    importc: "ecs_id_in_use".}
proc ecs_get_typeid*(world: ptr ecs_world_t; component: ecs_id_t): ecs_entity_t {.
    cdecl, importc: "ecs_get_typeid".}
proc ecs_id_match*(component: ecs_id_t; pattern: ecs_id_t): bool {.cdecl,
    importc: "ecs_id_match".}
proc ecs_id_is_pair*(component: ecs_id_t): bool {.cdecl,
    importc: "ecs_id_is_pair".}
proc ecs_id_is_wildcard*(component: ecs_id_t): bool {.cdecl,
    importc: "ecs_id_is_wildcard".}
proc ecs_id_is_any*(component: ecs_id_t): bool {.cdecl, importc: "ecs_id_is_any".}
proc ecs_id_is_valid*(world: ptr ecs_world_t; component: ecs_id_t): bool {.
    cdecl, importc: "ecs_id_is_valid".}
proc ecs_id_get_flags*(world: ptr ecs_world_t; component: ecs_id_t): ecs_flags32_t {.
    cdecl, importc: "ecs_id_get_flags".}
proc ecs_id_flag_str*(component_flags: uint64): cstring {.cdecl,
    importc: "ecs_id_flag_str".}
proc ecs_id_str*(world: ptr ecs_world_t; component: ecs_id_t): cstring {.cdecl,
    importc: "ecs_id_str".}
proc ecs_id_str_buf*(world: ptr ecs_world_t; component: ecs_id_t;
                     buf: ptr ecs_strbuf_t): void {.cdecl,
    importc: "ecs_id_str_buf".}
proc ecs_id_from_str*(world: ptr ecs_world_t; expr: cstring): ecs_id_t {.cdecl,
    importc: "ecs_id_from_str".}
proc ecs_term_ref_is_set*(ref_arg: ptr ecs_term_ref_t): bool {.cdecl,
    importc: "ecs_term_ref_is_set".}
proc ecs_term_is_initialized*(term: ptr ecs_term_t): bool {.cdecl,
    importc: "ecs_term_is_initialized".}
proc ecs_term_match_this*(term: ptr ecs_term_t): bool {.cdecl,
    importc: "ecs_term_match_this".}
proc ecs_term_match_0*(term: ptr ecs_term_t): bool {.cdecl,
    importc: "ecs_term_match_0".}
proc ecs_term_str*(world: ptr ecs_world_t; term: ptr ecs_term_t): cstring {.
    cdecl, importc: "ecs_term_str".}
proc ecs_query_str*(query: ptr ecs_query_t): cstring {.cdecl,
    importc: "ecs_query_str".}
proc ecs_each_id*(world: ptr ecs_world_t; component: ecs_id_t): ecs_iter_t {.
    cdecl, importc: "ecs_each_id".}
proc ecs_each_next*(it: ptr ecs_iter_t): bool {.cdecl, importc: "ecs_each_next".}
proc ecs_children*(world: ptr ecs_world_t; parent: ecs_entity_t): ecs_iter_t {.
    cdecl, importc: "ecs_children".}
proc ecs_children_w_rel*(world: ptr ecs_world_t; relationship: ecs_entity_t;
                         parent: ecs_entity_t): ecs_iter_t {.cdecl,
    importc: "ecs_children_w_rel".}
proc ecs_children_next*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_children_next".}
proc ecs_query_init*(world: ptr ecs_world_t; desc: ptr ecs_query_desc_t): ptr ecs_query_t {.
    cdecl, importc: "ecs_query_init".}
proc ecs_query_fini*(query: ptr ecs_query_t): void {.cdecl,
    importc: "ecs_query_fini".}
proc ecs_query_find_var*(query: ptr ecs_query_t; name: cstring): int32 {.cdecl,
    importc: "ecs_query_find_var".}
proc ecs_query_var_name*(query: ptr ecs_query_t; var_id: int32): cstring {.
    cdecl, importc: "ecs_query_var_name".}
proc ecs_query_var_is_entity*(query: ptr ecs_query_t; var_id: int32): bool {.
    cdecl, importc: "ecs_query_var_is_entity".}
proc ecs_query_iter*(world: ptr ecs_world_t; query: ptr ecs_query_t): ecs_iter_t {.
    cdecl, importc: "ecs_query_iter".}
proc ecs_query_next*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_query_next".}
proc ecs_query_has*(query: ptr ecs_query_t; entity: ecs_entity_t;
                    it: ptr ecs_iter_t): bool {.cdecl, importc: "ecs_query_has".}
proc ecs_query_has_table*(query: ptr ecs_query_t; table: ptr ecs_table_t;
                          it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_query_has_table".}
proc ecs_query_has_range*(query: ptr ecs_query_t; range: ptr ecs_table_range_t;
                          it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_query_has_range".}
proc ecs_query_match_count*(query: ptr ecs_query_t): int32 {.cdecl,
    importc: "ecs_query_match_count".}
proc ecs_query_plan*(query: ptr ecs_query_t): cstring {.cdecl,
    importc: "ecs_query_plan".}
proc ecs_query_plan_w_profile*(query: ptr ecs_query_t; it: ptr ecs_iter_t): cstring {.
    cdecl, importc: "ecs_query_plan_w_profile".}
proc ecs_query_plans*(query: ptr ecs_query_t): cstring {.cdecl,
    importc: "ecs_query_plans".}
proc ecs_query_args_parse*(query: ptr ecs_query_t; it: ptr ecs_iter_t;
                           expr: cstring): cstring {.cdecl,
    importc: "ecs_query_args_parse".}
proc ecs_query_changed*(query: ptr ecs_query_t): bool {.cdecl,
    importc: "ecs_query_changed".}
proc ecs_query_get*(world: ptr ecs_world_t; query: ecs_entity_t): ptr ecs_query_t {.
    cdecl, importc: "ecs_query_get".}
proc ecs_iter_skip*(it: ptr ecs_iter_t): void {.cdecl, importc: "ecs_iter_skip".}
proc ecs_iter_set_group*(it: ptr ecs_iter_t; group_id: uint64): void {.cdecl,
    importc: "ecs_iter_set_group".}
proc ecs_query_get_groups*(query: ptr ecs_query_t): ptr ecs_map_t {.cdecl,
    importc: "ecs_query_get_groups".}
proc ecs_query_get_group_ctx*(query: ptr ecs_query_t; group_id: uint64): pointer {.
    cdecl, importc: "ecs_query_get_group_ctx".}
proc ecs_query_get_group_info*(query: ptr ecs_query_t; group_id: uint64): ptr ecs_query_group_info_t {.
    cdecl, importc: "ecs_query_get_group_info".}
proc ecs_query_count*(query: ptr ecs_query_t): ecs_query_count_t {.cdecl,
    importc: "ecs_query_count".}
proc ecs_query_is_true*(query: ptr ecs_query_t): bool {.cdecl,
    importc: "ecs_query_is_true".}
proc ecs_query_get_cache_query*(query: ptr ecs_query_t): ptr ecs_query_t {.
    cdecl, importc: "ecs_query_get_cache_query".}
proc ecs_emit*(world: ptr ecs_world_t; desc: ptr ecs_event_desc_t): void {.
    cdecl, importc: "ecs_emit".}
proc ecs_enqueue*(world: ptr ecs_world_t; desc: ptr ecs_event_desc_t): void {.
    cdecl, importc: "ecs_enqueue".}
proc ecs_observer_init*(world: ptr ecs_world_t; desc: ptr ecs_observer_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_observer_init".}
proc ecs_observer_get*(world: ptr ecs_world_t; observer: ecs_entity_t): ptr ecs_observer_t {.
    cdecl, importc: "ecs_observer_get".}
proc ecs_iter_next*(it: ptr ecs_iter_t): bool {.cdecl, importc: "ecs_iter_next".}
proc ecs_iter_fini*(it: ptr ecs_iter_t): void {.cdecl, importc: "ecs_iter_fini".}
proc ecs_iter_count*(it: ptr ecs_iter_t): int32 {.cdecl,
    importc: "ecs_iter_count".}
proc ecs_iter_is_true*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_iter_is_true".}
proc ecs_iter_first*(it: ptr ecs_iter_t): ecs_entity_t {.cdecl,
    importc: "ecs_iter_first".}
proc ecs_iter_set_var*(it: ptr ecs_iter_t; var_id: int32; entity: ecs_entity_t): void {.
    cdecl, importc: "ecs_iter_set_var".}
proc ecs_iter_set_var_as_table*(it: ptr ecs_iter_t; var_id: int32;
                                table: ptr ecs_table_t): void {.cdecl,
    importc: "ecs_iter_set_var_as_table".}
proc ecs_iter_set_var_as_range*(it: ptr ecs_iter_t; var_id: int32;
                                range: ptr ecs_table_range_t): void {.cdecl,
    importc: "ecs_iter_set_var_as_range".}
proc ecs_iter_get_var*(it: ptr ecs_iter_t; var_id: int32): ecs_entity_t {.cdecl,
    importc: "ecs_iter_get_var".}
proc ecs_iter_get_var_name*(it: ptr ecs_iter_t; var_id: int32): cstring {.cdecl,
    importc: "ecs_iter_get_var_name".}
proc ecs_iter_get_var_count*(it: ptr ecs_iter_t): int32 {.cdecl,
    importc: "ecs_iter_get_var_count".}
proc ecs_iter_get_vars*(it: ptr ecs_iter_t): ptr ecs_var_t {.cdecl,
    importc: "ecs_iter_get_vars".}
proc ecs_iter_get_var_as_table*(it: ptr ecs_iter_t; var_id: int32): ptr ecs_table_t {.
    cdecl, importc: "ecs_iter_get_var_as_table".}
proc ecs_iter_get_var_as_range*(it: ptr ecs_iter_t; var_id: int32): ecs_table_range_t {.
    cdecl, importc: "ecs_iter_get_var_as_range".}
proc ecs_iter_var_is_constrained*(it: ptr ecs_iter_t; var_id: int32): bool {.
    cdecl, importc: "ecs_iter_var_is_constrained".}
proc ecs_iter_get_group*(it: ptr ecs_iter_t): uint64 {.cdecl,
    importc: "ecs_iter_get_group".}
proc ecs_iter_changed*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_iter_changed".}
proc ecs_iter_str*(it: ptr ecs_iter_t): cstring {.cdecl, importc: "ecs_iter_str".}
proc ecs_page_iter*(it: ptr ecs_iter_t; offset: int32; limit: int32): ecs_iter_t {.
    cdecl, importc: "ecs_page_iter".}
proc ecs_page_next*(it: ptr ecs_iter_t): bool {.cdecl, importc: "ecs_page_next".}
proc ecs_worker_iter*(it: ptr ecs_iter_t; index: int32; count: int32): ecs_iter_t {.
    cdecl, importc: "ecs_worker_iter".}
proc ecs_worker_next*(it: ptr ecs_iter_t): bool {.cdecl,
    importc: "ecs_worker_next".}
proc ecs_field_w_size*(it: ptr ecs_iter_t; size: csize_t; index: int8): pointer {.
    cdecl, importc: "ecs_field_w_size".}
proc ecs_field_at_w_size*(it: ptr ecs_iter_t; size: csize_t; index: int8;
                          row: int32): pointer {.cdecl,
    importc: "ecs_field_at_w_size".}
proc ecs_field_is_readonly*(it: ptr ecs_iter_t; index: int8): bool {.cdecl,
    importc: "ecs_field_is_readonly".}
proc ecs_field_is_writeonly*(it: ptr ecs_iter_t; index: int8): bool {.cdecl,
    importc: "ecs_field_is_writeonly".}
proc ecs_field_is_set*(it: ptr ecs_iter_t; index: int8): bool {.cdecl,
    importc: "ecs_field_is_set".}
proc ecs_field_id*(it: ptr ecs_iter_t; index: int8): ecs_id_t {.cdecl,
    importc: "ecs_field_id".}
proc ecs_field_column*(it: ptr ecs_iter_t; index: int8): int32 {.cdecl,
    importc: "ecs_field_column".}
proc ecs_field_src*(it: ptr ecs_iter_t; index: int8): ecs_entity_t {.cdecl,
    importc: "ecs_field_src".}
proc ecs_field_size*(it: ptr ecs_iter_t; index: int8): csize_t {.cdecl,
    importc: "ecs_field_size".}
proc ecs_field_is_self*(it: ptr ecs_iter_t; index: int8): bool {.cdecl,
    importc: "ecs_field_is_self".}
proc ecs_table_get_type*(table: ptr ecs_table_t): ptr ecs_type_t {.cdecl,
    importc: "ecs_table_get_type".}
proc ecs_table_get_type_index*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                               component: ecs_id_t): int32 {.cdecl,
    importc: "ecs_table_get_type_index".}
proc ecs_table_get_column_index*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                                 component: ecs_id_t): int32 {.cdecl,
    importc: "ecs_table_get_column_index".}
proc ecs_table_column_count*(table: ptr ecs_table_t): int32 {.cdecl,
    importc: "ecs_table_column_count".}
proc ecs_table_type_to_column_index*(table: ptr ecs_table_t; index: int32): int32 {.
    cdecl, importc: "ecs_table_type_to_column_index".}
proc ecs_table_column_to_type_index*(table: ptr ecs_table_t; index: int32): int32 {.
    cdecl, importc: "ecs_table_column_to_type_index".}
proc ecs_table_get_column*(table: ptr ecs_table_t; index: int32; offset: int32): pointer {.
    cdecl, importc: "ecs_table_get_column".}
proc ecs_table_get_id*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                       component: ecs_id_t; offset: int32): pointer {.cdecl,
    importc: "ecs_table_get_id".}
proc ecs_table_get_column_size*(table: ptr ecs_table_t; index: int32): csize_t {.
    cdecl, importc: "ecs_table_get_column_size".}
proc ecs_table_count*(table: ptr ecs_table_t): int32 {.cdecl,
    importc: "ecs_table_count".}
proc ecs_table_size*(table: ptr ecs_table_t): int32 {.cdecl,
    importc: "ecs_table_size".}
proc ecs_table_entities*(table: ptr ecs_table_t): ptr ecs_entity_t {.cdecl,
    importc: "ecs_table_entities".}
proc ecs_table_has_id*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                       component: ecs_id_t): bool {.cdecl,
    importc: "ecs_table_has_id".}
proc ecs_table_get_target*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                           relationship: ecs_entity_t; index: int32): ecs_entity_t {.
    cdecl, importc: "ecs_table_get_target".}
proc ecs_table_get_depth*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                          rel: ecs_entity_t): int32 {.cdecl,
    importc: "ecs_table_get_depth".}
proc ecs_table_add_id*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                       component: ecs_id_t): ptr ecs_table_t {.cdecl,
    importc: "ecs_table_add_id".}
proc ecs_table_find*(world: ptr ecs_world_t; ids: ptr ecs_id_t; id_count: int32): ptr ecs_table_t {.
    cdecl, importc: "ecs_table_find".}
proc ecs_table_remove_id*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                          component: ecs_id_t): ptr ecs_table_t {.cdecl,
    importc: "ecs_table_remove_id".}
proc ecs_table_lock*(world: ptr ecs_world_t; table: ptr ecs_table_t): void {.
    cdecl, importc: "ecs_table_lock".}
proc ecs_table_unlock*(world: ptr ecs_world_t; table: ptr ecs_table_t): void {.
    cdecl, importc: "ecs_table_unlock".}
proc ecs_table_has_flags*(table: ptr ecs_table_t; flags: ecs_flags32_t): bool {.
    cdecl, importc: "ecs_table_has_flags".}
proc ecs_table_has_traversable*(table: ptr ecs_table_t): bool {.cdecl,
    importc: "ecs_table_has_traversable".}
proc ecs_table_swap_rows*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                          row_1: int32; row_2: int32): void {.cdecl,
    importc: "ecs_table_swap_rows".}
proc ecs_commit*(world: ptr ecs_world_t; entity: ecs_entity_t;
                 record: ptr ecs_record_t; table: ptr ecs_table_t;
                 added: ptr ecs_type_t; removed: ptr ecs_type_t): bool {.cdecl,
    importc: "ecs_commit".}
proc ecs_search*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                 component: ecs_id_t; component_out: ptr ecs_id_t): int32 {.
    cdecl, importc: "ecs_search".}
proc ecs_search_offset*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                        offset: int32; component: ecs_id_t;
                        component_out: ptr ecs_id_t): int32 {.cdecl,
    importc: "ecs_search_offset".}
proc ecs_search_relation*(world: ptr ecs_world_t; table: ptr ecs_table_t;
                          offset: int32; component: ecs_id_t; rel: ecs_entity_t;
                          flags: ecs_flags64_t; tgt_out: ptr ecs_entity_t;
                          component_out: ptr ecs_id_t;
                          tr_out: ptr ptr struct_ecs_table_record_t): int32 {.
    cdecl, importc: "ecs_search_relation".}
proc ecs_search_relation_for_entity*(world: ptr ecs_world_t;
                                     entity: ecs_entity_t; id: ecs_id_t;
                                     rel: ecs_entity_t; self: bool;
                                     cr: ptr ecs_component_record_t;
                                     tgt_out: ptr ecs_entity_t;
                                     id_out: ptr ecs_id_t;
                                     tr_out: ptr ptr struct_ecs_table_record_t): int32 {.
    cdecl, importc: "ecs_search_relation_for_entity".}
proc ecs_table_clear_entities*(world: ptr ecs_world_t; table: ptr ecs_table_t): void {.
    cdecl, importc: "ecs_table_clear_entities".}
proc ecs_value_init*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     ptr_arg: pointer): cint {.cdecl, importc: "ecs_value_init".}
proc ecs_value_init_w_type_info*(world: ptr ecs_world_t;
                                 ti: ptr ecs_type_info_t; ptr_arg: pointer): cint {.
    cdecl, importc: "ecs_value_init_w_type_info".}
proc ecs_value_new*(world: ptr ecs_world_t; type_arg: ecs_entity_t): pointer {.
    cdecl, importc: "ecs_value_new".}
proc ecs_value_new_w_type_info*(world: ptr ecs_world_t; ti: ptr ecs_type_info_t): pointer {.
    cdecl, importc: "ecs_value_new_w_type_info".}
proc ecs_value_fini_w_type_info*(world: ptr ecs_world_t;
                                 ti: ptr ecs_type_info_t; ptr_arg: pointer): cint {.
    cdecl, importc: "ecs_value_fini_w_type_info".}
proc ecs_value_fini*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     ptr_arg: pointer): cint {.cdecl, importc: "ecs_value_fini".}
proc ecs_value_free*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     ptr_arg: pointer): cint {.cdecl, importc: "ecs_value_free".}
proc ecs_value_copy_w_type_info*(world: ptr ecs_world_t;
                                 ti: ptr ecs_type_info_t; dst: pointer;
                                 src: pointer): cint {.cdecl,
    importc: "ecs_value_copy_w_type_info".}
proc ecs_value_copy*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     dst: pointer; src: pointer): cint {.cdecl,
    importc: "ecs_value_copy".}
proc ecs_value_move_w_type_info*(world: ptr ecs_world_t;
                                 ti: ptr ecs_type_info_t; dst: pointer;
                                 src: pointer): cint {.cdecl,
    importc: "ecs_value_move_w_type_info".}
proc ecs_value_move*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     dst: pointer; src: pointer): cint {.cdecl,
    importc: "ecs_value_move".}
proc ecs_value_move_ctor_w_type_info*(world: ptr ecs_world_t;
                                      ti: ptr ecs_type_info_t; dst: pointer;
                                      src: pointer): cint {.cdecl,
    importc: "ecs_value_move_ctor_w_type_info".}
proc ecs_value_move_ctor*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                          dst: pointer; src: pointer): cint {.cdecl,
    importc: "ecs_value_move_ctor".}
proc ecs_deprecated_private*(file: cstring; line: int32; msg: cstring): void {.
    cdecl, importc: "ecs_deprecated_".}
proc ecs_log_push_private*(level: int32): void {.cdecl, importc: "ecs_log_push_".}
proc ecs_log_pop_private*(level: int32): void {.cdecl, importc: "ecs_log_pop_".}
proc ecs_should_log*(level: int32): bool {.cdecl, importc: "ecs_should_log".}
proc ecs_strerror*(error_code: int32): cstring {.cdecl, importc: "ecs_strerror".}
proc ecs_print_private*(level: int32; file: cstring; line: int32; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_print_".}
proc ecs_printv_private*(level: cint; file: cstring; line: int32; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_printv_".}
proc ecs_log_private*(level: int32; file: cstring; line: int32; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_log_".}
proc ecs_logv_private*(level: cint; file: cstring; line: int32; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_logv_".}
proc ecs_abort_private*(error_code: int32; file: cstring; line: int32;
                        fmt: cstring): void {.cdecl, varargs,
    importc: "ecs_abort_".}
proc ecs_assert_log_private*(error_code: int32; condition_str: cstring;
                             file: cstring; line: int32; fmt: cstring): void {.
    cdecl, varargs, importc: "ecs_assert_log_".}
proc ecs_parser_error_private*(name: cstring; expr: cstring; column: int64;
                               fmt: cstring): void {.cdecl, varargs,
    importc: "ecs_parser_error_".}
proc ecs_parser_errorv_private*(name: cstring; expr: cstring; column: int64;
                                fmt: cstring): void {.cdecl, varargs,
    importc: "ecs_parser_errorv_".}
proc ecs_parser_warning_private*(name: cstring; expr: cstring; column: int64;
                                 fmt: cstring): void {.cdecl, varargs,
    importc: "ecs_parser_warning_".}
proc ecs_parser_warningv_private*(name: cstring; expr: cstring; column: int64;
                                  fmt: cstring): void {.cdecl, varargs,
    importc: "ecs_parser_warningv_".}
proc ecs_log_set_level*(level: cint): cint {.cdecl, importc: "ecs_log_set_level".}
proc ecs_log_get_level*(): cint {.cdecl, importc: "ecs_log_get_level".}
proc ecs_log_enable_colors*(enabled: bool): bool {.cdecl,
    importc: "ecs_log_enable_colors".}
proc ecs_log_enable_timestamp*(enabled: bool): bool {.cdecl,
    importc: "ecs_log_enable_timestamp".}
proc ecs_log_enable_timedelta*(enabled: bool): bool {.cdecl,
    importc: "ecs_log_enable_timedelta".}
proc ecs_log_last_error*(): cint {.cdecl, importc: "ecs_log_last_error".}
proc ecs_log_start_capture*(capture_try: bool): void {.cdecl,
    importc: "ecs_log_start_capture".}
proc ecs_log_stop_capture*(): cstring {.cdecl, importc: "ecs_log_stop_capture".}
proc ecs_app_run*(world: ptr ecs_world_t; desc: ptr ecs_app_desc_t): cint {.
    cdecl, importc: "ecs_app_run".}
proc ecs_app_run_frame*(world: ptr ecs_world_t; desc: ptr ecs_app_desc_t): cint {.
    cdecl, importc: "ecs_app_run_frame".}
proc ecs_app_set_run_action*(callback: ecs_app_run_action_t): cint {.cdecl,
    importc: "ecs_app_set_run_action".}
proc ecs_app_set_frame_action*(callback: ecs_app_frame_action_t): cint {.cdecl,
    importc: "ecs_app_set_frame_action".}
var ecs_http_request_received_count* {.importc: "ecs_http_request_received_count".}: int64
var ecs_http_request_invalid_count* {.importc: "ecs_http_request_invalid_count".}: int64
var ecs_http_request_handled_ok_count* {.
    importc: "ecs_http_request_handled_ok_count".}: int64
var ecs_http_request_handled_error_count*
    {.importc: "ecs_http_request_handled_error_count".}: int64
var ecs_http_request_not_handled_count* {.
    importc: "ecs_http_request_not_handled_count".}: int64
var ecs_http_request_preflight_count* {.importc: "ecs_http_request_preflight_count".}: int64
var ecs_http_send_ok_count* {.importc: "ecs_http_send_ok_count".}: int64
var ecs_http_send_error_count* {.importc: "ecs_http_send_error_count".}: int64
var ecs_http_busy_count* {.importc: "ecs_http_busy_count".}: int64
proc ecs_http_server_init*(desc: ptr ecs_http_server_desc_t): ptr ecs_http_server_t {.
    cdecl, importc: "ecs_http_server_init".}
proc ecs_http_server_fini*(server: ptr ecs_http_server_t): void {.cdecl,
    importc: "ecs_http_server_fini".}
proc ecs_http_server_start*(server: ptr ecs_http_server_t): cint {.cdecl,
    importc: "ecs_http_server_start".}
proc ecs_http_server_dequeue*(server: ptr ecs_http_server_t; delta_time: cfloat): void {.
    cdecl, importc: "ecs_http_server_dequeue".}
proc ecs_http_server_stop*(server: ptr ecs_http_server_t): void {.cdecl,
    importc: "ecs_http_server_stop".}
proc ecs_http_server_http_request*(srv: ptr ecs_http_server_t; req: cstring;
                                   len: ecs_size_t;
                                   reply_out: ptr ecs_http_reply_t): cint {.
    cdecl, importc: "ecs_http_server_http_request".}
proc ecs_http_server_request*(srv: ptr ecs_http_server_t; method_arg: cstring;
                              req: cstring; body: cstring;
                              reply_out: ptr ecs_http_reply_t): cint {.cdecl,
    importc: "ecs_http_server_request".}
proc ecs_http_server_ctx*(srv: ptr ecs_http_server_t): pointer {.cdecl,
    importc: "ecs_http_server_ctx".}
proc ecs_http_get_header*(req: ptr ecs_http_request_t; name: cstring): cstring {.
    cdecl, importc: "ecs_http_get_header".}
proc ecs_http_get_param*(req: ptr ecs_http_request_t; name: cstring): cstring {.
    cdecl, importc: "ecs_http_get_param".}
var FLECS_IDEcsRestID_private* {.importc: "FLECS_IDEcsRestID_".}: ecs_entity_t
proc ecs_rest_server_init*(world: ptr ecs_world_t;
                           desc: ptr ecs_http_server_desc_t): ptr ecs_http_server_t {.
    cdecl, importc: "ecs_rest_server_init".}
proc ecs_rest_server_fini*(srv: ptr ecs_http_server_t): void {.cdecl,
    importc: "ecs_rest_server_fini".}
proc FlecsRestImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsRestImport".}
proc ecs_set_timeout*(world: ptr ecs_world_t; tick_source: ecs_entity_t;
                      timeout: cfloat): ecs_entity_t {.cdecl,
    importc: "ecs_set_timeout".}
proc ecs_get_timeout*(world: ptr ecs_world_t; tick_source: ecs_entity_t): cfloat {.
    cdecl, importc: "ecs_get_timeout".}
proc ecs_set_interval*(world: ptr ecs_world_t; tick_source: ecs_entity_t;
                       interval: cfloat): ecs_entity_t {.cdecl,
    importc: "ecs_set_interval".}
proc ecs_get_interval*(world: ptr ecs_world_t; tick_source: ecs_entity_t): cfloat {.
    cdecl, importc: "ecs_get_interval".}
proc ecs_start_timer*(world: ptr ecs_world_t; tick_source: ecs_entity_t): void {.
    cdecl, importc: "ecs_start_timer".}
proc ecs_stop_timer*(world: ptr ecs_world_t; tick_source: ecs_entity_t): void {.
    cdecl, importc: "ecs_stop_timer".}
proc ecs_reset_timer*(world: ptr ecs_world_t; tick_source: ecs_entity_t): void {.
    cdecl, importc: "ecs_reset_timer".}
proc ecs_randomize_timers*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_randomize_timers".}
proc ecs_set_rate*(world: ptr ecs_world_t; tick_source: ecs_entity_t;
                   rate: int32; source: ecs_entity_t): ecs_entity_t {.cdecl,
    importc: "ecs_set_rate".}
proc ecs_set_tick_source*(world: ptr ecs_world_t; system: ecs_entity_t;
                          tick_source: ecs_entity_t): void {.cdecl,
    importc: "ecs_set_tick_source".}
proc FlecsTimerImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsTimerImport".}
proc ecs_pipeline_init*(world: ptr ecs_world_t; desc: ptr ecs_pipeline_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_pipeline_init".}
proc ecs_set_pipeline*(world: ptr ecs_world_t; pipeline: ecs_entity_t): void {.
    cdecl, importc: "ecs_set_pipeline".}
proc ecs_get_pipeline*(world: ptr ecs_world_t): ecs_entity_t {.cdecl,
    importc: "ecs_get_pipeline".}
proc ecs_progress*(world: ptr ecs_world_t; delta_time: cfloat): bool {.cdecl,
    importc: "ecs_progress".}
proc ecs_set_time_scale*(world: ptr ecs_world_t; scale: cfloat): void {.cdecl,
    importc: "ecs_set_time_scale".}
proc ecs_reset_clock*(world: ptr ecs_world_t): void {.cdecl,
    importc: "ecs_reset_clock".}
proc ecs_run_pipeline*(world: ptr ecs_world_t; pipeline: ecs_entity_t;
                       delta_time: cfloat): void {.cdecl,
    importc: "ecs_run_pipeline".}
proc ecs_set_threads*(world: ptr ecs_world_t; threads: int32): void {.cdecl,
    importc: "ecs_set_threads".}
proc ecs_set_task_threads*(world: ptr ecs_world_t; task_threads: int32): void {.
    cdecl, importc: "ecs_set_task_threads".}
proc ecs_using_task_threads*(world: ptr ecs_world_t): bool {.cdecl,
    importc: "ecs_using_task_threads".}
proc FlecsPipelineImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsPipelineImport".}
proc ecs_system_init*(world: ptr ecs_world_t; desc: ptr ecs_system_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_system_init".}
proc ecs_system_get*(world: ptr ecs_world_t; system: ecs_entity_t): ptr ecs_system_t {.
    cdecl, importc: "ecs_system_get".}
proc ecs_system_set_group*(world: ptr ecs_world_t; system: ecs_entity_t;
                           group_id: uint64): void {.cdecl,
    importc: "ecs_system_set_group".}
proc ecs_run*(world: ptr ecs_world_t; system: ecs_entity_t; delta_time: cfloat;
              param: pointer): ecs_entity_t {.cdecl, importc: "ecs_run".}
proc ecs_run_worker*(world: ptr ecs_world_t; system: ecs_entity_t;
                     stage_current: int32; stage_count: int32;
                     delta_time: cfloat; param: pointer): ecs_entity_t {.cdecl,
    importc: "ecs_run_worker".}
proc FlecsSystemImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsSystemImport".}
proc ecs_world_stats_get*(world: ptr ecs_world_t; stats: ptr ecs_world_stats_t): void {.
    cdecl, importc: "ecs_world_stats_get".}
proc ecs_world_stats_reduce*(dst: ptr ecs_world_stats_t;
                             src: ptr ecs_world_stats_t): void {.cdecl,
    importc: "ecs_world_stats_reduce".}
proc ecs_world_stats_reduce_last*(stats: ptr ecs_world_stats_t;
                                  old: ptr ecs_world_stats_t; count: int32): void {.
    cdecl, importc: "ecs_world_stats_reduce_last".}
proc ecs_world_stats_repeat_last*(stats: ptr ecs_world_stats_t): void {.cdecl,
    importc: "ecs_world_stats_repeat_last".}
proc ecs_world_stats_copy_last*(dst: ptr ecs_world_stats_t;
                                src: ptr ecs_world_stats_t): void {.cdecl,
    importc: "ecs_world_stats_copy_last".}
proc ecs_world_stats_log*(world: ptr ecs_world_t; stats: ptr ecs_world_stats_t): void {.
    cdecl, importc: "ecs_world_stats_log".}
proc ecs_query_stats_get*(world: ptr ecs_world_t; query: ptr ecs_query_t;
                          stats: ptr ecs_query_stats_t): void {.cdecl,
    importc: "ecs_query_stats_get".}
proc ecs_query_cache_stats_reduce*(dst: ptr ecs_query_stats_t;
                                   src: ptr ecs_query_stats_t): void {.cdecl,
    importc: "ecs_query_cache_stats_reduce".}
proc ecs_query_cache_stats_reduce_last*(stats: ptr ecs_query_stats_t;
                                        old: ptr ecs_query_stats_t; count: int32): void {.
    cdecl, importc: "ecs_query_cache_stats_reduce_last".}
proc ecs_query_cache_stats_repeat_last*(stats: ptr ecs_query_stats_t): void {.
    cdecl, importc: "ecs_query_cache_stats_repeat_last".}
proc ecs_query_cache_stats_copy_last*(dst: ptr ecs_query_stats_t;
                                      src: ptr ecs_query_stats_t): void {.cdecl,
    importc: "ecs_query_cache_stats_copy_last".}
proc ecs_system_stats_get*(world: ptr ecs_world_t; system: ecs_entity_t;
                           stats: ptr ecs_system_stats_t): bool {.cdecl,
    importc: "ecs_system_stats_get".}
proc ecs_system_stats_reduce*(dst: ptr ecs_system_stats_t;
                              src: ptr ecs_system_stats_t): void {.cdecl,
    importc: "ecs_system_stats_reduce".}
proc ecs_system_stats_reduce_last*(stats: ptr ecs_system_stats_t;
                                   old: ptr ecs_system_stats_t; count: int32): void {.
    cdecl, importc: "ecs_system_stats_reduce_last".}
proc ecs_system_stats_repeat_last*(stats: ptr ecs_system_stats_t): void {.cdecl,
    importc: "ecs_system_stats_repeat_last".}
proc ecs_system_stats_copy_last*(dst: ptr ecs_system_stats_t;
                                 src: ptr ecs_system_stats_t): void {.cdecl,
    importc: "ecs_system_stats_copy_last".}
proc ecs_pipeline_stats_get*(world: ptr ecs_world_t; pipeline: ecs_entity_t;
                             stats: ptr ecs_pipeline_stats_t): bool {.cdecl,
    importc: "ecs_pipeline_stats_get".}
proc ecs_pipeline_stats_fini*(stats: ptr ecs_pipeline_stats_t): void {.cdecl,
    importc: "ecs_pipeline_stats_fini".}
proc ecs_pipeline_stats_reduce*(dst: ptr ecs_pipeline_stats_t;
                                src: ptr ecs_pipeline_stats_t): void {.cdecl,
    importc: "ecs_pipeline_stats_reduce".}
proc ecs_pipeline_stats_reduce_last*(stats: ptr ecs_pipeline_stats_t;
                                     old: ptr ecs_pipeline_stats_t; count: int32): void {.
    cdecl, importc: "ecs_pipeline_stats_reduce_last".}
proc ecs_pipeline_stats_repeat_last*(stats: ptr ecs_pipeline_stats_t): void {.
    cdecl, importc: "ecs_pipeline_stats_repeat_last".}
proc ecs_pipeline_stats_copy_last*(dst: ptr ecs_pipeline_stats_t;
                                   src: ptr ecs_pipeline_stats_t): void {.cdecl,
    importc: "ecs_pipeline_stats_copy_last".}
proc ecs_metric_reduce*(dst: ptr ecs_metric_t; src: ptr ecs_metric_t;
                        t_dst: int32; t_src: int32): void {.cdecl,
    importc: "ecs_metric_reduce".}
proc ecs_metric_reduce_last*(m: ptr ecs_metric_t; t: int32; count: int32): void {.
    cdecl, importc: "ecs_metric_reduce_last".}
proc ecs_metric_copy*(m: ptr ecs_metric_t; dst: int32; src: int32): void {.
    cdecl, importc: "ecs_metric_copy".}
var FLECS_IDFlecsStatsID_private* {.importc: "FLECS_IDFlecsStatsID_".}: ecs_entity_t
var FLECS_IDEcsWorldStatsID_private* {.importc: "FLECS_IDEcsWorldStatsID_".}: ecs_entity_t
var FLECS_IDEcsWorldSummaryID_private* {.importc: "FLECS_IDEcsWorldSummaryID_".}: ecs_entity_t
var FLECS_IDEcsSystemStatsID_private* {.importc: "FLECS_IDEcsSystemStatsID_".}: ecs_entity_t
var FLECS_IDEcsPipelineStatsID_private* {.importc: "FLECS_IDEcsPipelineStatsID_".}: ecs_entity_t
var FLECS_IDecs_entities_memory_tID_private*
    {.importc: "FLECS_IDecs_entities_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_component_index_memory_tID_private*
    {.importc: "FLECS_IDecs_component_index_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_query_memory_tID_private*
    {.importc: "FLECS_IDecs_query_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_component_memory_tID_private*
    {.importc: "FLECS_IDecs_component_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_table_memory_tID_private*
    {.importc: "FLECS_IDecs_table_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_misc_memory_tID_private* {.
    importc: "FLECS_IDecs_misc_memory_tID_".}: ecs_entity_t
var FLECS_IDecs_table_histogram_tID_private*
    {.importc: "FLECS_IDecs_table_histogram_tID_".}: ecs_entity_t
var FLECS_IDecs_allocator_memory_tID_private*
    {.importc: "FLECS_IDecs_allocator_memory_tID_".}: ecs_entity_t
var FLECS_IDEcsWorldMemoryID_private* {.importc: "FLECS_IDEcsWorldMemoryID_".}: ecs_entity_t
var EcsPeriod1s* {.importc: "EcsPeriod1s".}: ecs_entity_t
var EcsPeriod1m* {.importc: "EcsPeriod1m".}: ecs_entity_t
var EcsPeriod1h* {.importc: "EcsPeriod1h".}: ecs_entity_t
var EcsPeriod1d* {.importc: "EcsPeriod1d".}: ecs_entity_t
var EcsPeriod1w* {.importc: "EcsPeriod1w".}: ecs_entity_t
proc ecs_entity_memory_get*(world: ptr ecs_world_t): ecs_entities_memory_t {.
    cdecl, importc: "ecs_entity_memory_get".}
proc ecs_component_record_memory_get*(cr: ptr ecs_component_record_t;
                                      result: ptr ecs_component_index_memory_t): void {.
    cdecl, importc: "ecs_component_record_memory_get".}
proc ecs_component_index_memory_get*(world: ptr ecs_world_t): ecs_component_index_memory_t {.
    cdecl, importc: "ecs_component_index_memory_get".}
proc ecs_query_memory_get*(query: ptr ecs_query_t;
                           result: ptr ecs_query_memory_t): void {.cdecl,
    importc: "ecs_query_memory_get".}
proc ecs_queries_memory_get*(world: ptr ecs_world_t): ecs_query_memory_t {.
    cdecl, importc: "ecs_queries_memory_get".}
proc ecs_table_component_memory_get*(table: ptr ecs_table_t;
                                     result: ptr ecs_component_memory_t): void {.
    cdecl, importc: "ecs_table_component_memory_get".}
proc ecs_component_memory_get*(world: ptr ecs_world_t): ecs_component_memory_t {.
    cdecl, importc: "ecs_component_memory_get".}
proc ecs_table_memory_get*(table: ptr ecs_table_t;
                           result: ptr ecs_table_memory_t): void {.cdecl,
    importc: "ecs_table_memory_get".}
proc ecs_tables_memory_get*(world: ptr ecs_world_t): ecs_table_memory_t {.cdecl,
    importc: "ecs_tables_memory_get".}
proc ecs_table_histogram_get*(world: ptr ecs_world_t): ecs_table_histogram_t {.
    cdecl, importc: "ecs_table_histogram_get".}
proc ecs_misc_memory_get*(world: ptr ecs_world_t): ecs_misc_memory_t {.cdecl,
    importc: "ecs_misc_memory_get".}
proc ecs_allocator_memory_get*(world: ptr ecs_world_t): ecs_allocator_memory_t {.
    cdecl, importc: "ecs_allocator_memory_get".}
proc ecs_memory_get*(world: ptr ecs_world_t): ecs_size_t {.cdecl,
    importc: "ecs_memory_get".}
proc FlecsStatsImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsStatsImport".}
var FLECS_IDFlecsMetricsID_private* {.importc: "FLECS_IDFlecsMetricsID_".}: ecs_entity_t
var EcsMetric* {.importc: "EcsMetric".}: ecs_entity_t
var FLECS_IDEcsMetricID_private* {.importc: "FLECS_IDEcsMetricID_".}: ecs_entity_t
var EcsCounter* {.importc: "EcsCounter".}: ecs_entity_t
var FLECS_IDEcsCounterID_private* {.importc: "FLECS_IDEcsCounterID_".}: ecs_entity_t
var EcsCounterIncrement* {.importc: "EcsCounterIncrement".}: ecs_entity_t
var FLECS_IDEcsCounterIncrementID_private*
    {.importc: "FLECS_IDEcsCounterIncrementID_".}: ecs_entity_t
var EcsCounterId* {.importc: "EcsCounterId".}: ecs_entity_t
var FLECS_IDEcsCounterIdID_private* {.importc: "FLECS_IDEcsCounterIdID_".}: ecs_entity_t
var EcsGauge* {.importc: "EcsGauge".}: ecs_entity_t
var FLECS_IDEcsGaugeID_private* {.importc: "FLECS_IDEcsGaugeID_".}: ecs_entity_t
var EcsMetricInstance* {.importc: "EcsMetricInstance".}: ecs_entity_t
var FLECS_IDEcsMetricInstanceID_private* {.
    importc: "FLECS_IDEcsMetricInstanceID_".}: ecs_entity_t
var FLECS_IDEcsMetricValueID_private* {.importc: "FLECS_IDEcsMetricValueID_".}: ecs_entity_t
var FLECS_IDEcsMetricSourceID_private* {.importc: "FLECS_IDEcsMetricSourceID_".}: ecs_entity_t
proc ecs_metric_init*(world: ptr ecs_world_t; desc: ptr ecs_metric_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_metric_init".}
proc FlecsMetricsImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsMetricsImport".}
var FLECS_IDFlecsAlertsID_private* {.importc: "FLECS_IDFlecsAlertsID_".}: ecs_entity_t
var FLECS_IDEcsAlertID_private* {.importc: "FLECS_IDEcsAlertID_".}: ecs_entity_t
var FLECS_IDEcsAlertInstanceID_private* {.importc: "FLECS_IDEcsAlertInstanceID_".}: ecs_entity_t
var FLECS_IDEcsAlertsActiveID_private* {.importc: "FLECS_IDEcsAlertsActiveID_".}: ecs_entity_t
var FLECS_IDEcsAlertTimeoutID_private* {.importc: "FLECS_IDEcsAlertTimeoutID_".}: ecs_entity_t
var EcsAlertInfo* {.importc: "EcsAlertInfo".}: ecs_entity_t
var FLECS_IDEcsAlertInfoID_private* {.importc: "FLECS_IDEcsAlertInfoID_".}: ecs_entity_t
var EcsAlertWarning* {.importc: "EcsAlertWarning".}: ecs_entity_t
var FLECS_IDEcsAlertWarningID_private* {.importc: "FLECS_IDEcsAlertWarningID_".}: ecs_entity_t
var EcsAlertError* {.importc: "EcsAlertError".}: ecs_entity_t
var FLECS_IDEcsAlertErrorID_private* {.importc: "FLECS_IDEcsAlertErrorID_".}: ecs_entity_t
var EcsAlertCritical* {.importc: "EcsAlertCritical".}: ecs_entity_t
var FLECS_IDEcsAlertCriticalID_private* {.importc: "FLECS_IDEcsAlertCriticalID_".}: ecs_entity_t
proc ecs_alert_init*(world: ptr ecs_world_t; desc: ptr ecs_alert_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_alert_init".}
proc ecs_get_alert_count*(world: ptr ecs_world_t; entity: ecs_entity_t;
                          alert: ecs_entity_t): int32 {.cdecl,
    importc: "ecs_get_alert_count".}
proc ecs_get_alert*(world: ptr ecs_world_t; entity: ecs_entity_t;
                    alert: ecs_entity_t): ecs_entity_t {.cdecl,
    importc: "ecs_get_alert".}
proc FlecsAlertsImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsAlertsImport".}
proc ecs_ptr_from_json*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                        ptr_arg: pointer; json: cstring;
                        desc: ptr ecs_from_json_desc_t): cstring {.cdecl,
    importc: "ecs_ptr_from_json".}
proc ecs_entity_from_json*(world: ptr ecs_world_t; entity: ecs_entity_t;
                           json: cstring; desc: ptr ecs_from_json_desc_t): cstring {.
    cdecl, importc: "ecs_entity_from_json".}
proc ecs_world_from_json*(world: ptr ecs_world_t; json: cstring;
                          desc: ptr ecs_from_json_desc_t): cstring {.cdecl,
    importc: "ecs_world_from_json".}
proc ecs_world_from_json_file*(world: ptr ecs_world_t; filename: cstring;
                               desc: ptr ecs_from_json_desc_t): cstring {.cdecl,
    importc: "ecs_world_from_json_file".}
proc ecs_array_to_json*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                        data: pointer; count: int32): cstring {.cdecl,
    importc: "ecs_array_to_json".}
proc ecs_array_to_json_buf*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                            data: pointer; count: int32;
                            buf_out: ptr ecs_strbuf_t): cint {.cdecl,
    importc: "ecs_array_to_json_buf".}
proc ecs_ptr_to_json*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                      data: pointer): cstring {.cdecl,
    importc: "ecs_ptr_to_json".}
proc ecs_ptr_to_json_buf*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                          data: pointer; buf_out: ptr ecs_strbuf_t): cint {.
    cdecl, importc: "ecs_ptr_to_json_buf".}
proc ecs_type_info_to_json*(world: ptr ecs_world_t; type_arg: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_type_info_to_json".}
proc ecs_type_info_to_json_buf*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                                buf_out: ptr ecs_strbuf_t): cint {.cdecl,
    importc: "ecs_type_info_to_json_buf".}
proc ecs_entity_to_json*(world: ptr ecs_world_t; entity: ecs_entity_t;
                         desc: ptr ecs_entity_to_json_desc_t): cstring {.cdecl,
    importc: "ecs_entity_to_json".}
proc ecs_entity_to_json_buf*(world: ptr ecs_world_t; entity: ecs_entity_t;
                             buf_out: ptr ecs_strbuf_t;
                             desc: ptr ecs_entity_to_json_desc_t): cint {.cdecl,
    importc: "ecs_entity_to_json_buf".}
proc ecs_iter_to_json*(iter: ptr ecs_iter_t; desc: ptr ecs_iter_to_json_desc_t): cstring {.
    cdecl, importc: "ecs_iter_to_json".}
proc ecs_iter_to_json_buf*(iter: ptr ecs_iter_t; buf_out: ptr ecs_strbuf_t;
                           desc: ptr ecs_iter_to_json_desc_t): cint {.cdecl,
    importc: "ecs_iter_to_json_buf".}
proc ecs_world_to_json*(world: ptr ecs_world_t;
                        desc: ptr ecs_world_to_json_desc_t): cstring {.cdecl,
    importc: "ecs_world_to_json".}
proc ecs_world_to_json_buf*(world: ptr ecs_world_t; buf_out: ptr ecs_strbuf_t;
                            desc: ptr ecs_world_to_json_desc_t): cint {.cdecl,
    importc: "ecs_world_to_json_buf".}
var EcsUnitPrefixes* {.importc: "EcsUnitPrefixes".}: ecs_entity_t
var EcsYocto* {.importc: "EcsYocto".}: ecs_entity_t
var EcsZepto* {.importc: "EcsZepto".}: ecs_entity_t
var EcsAtto* {.importc: "EcsAtto".}: ecs_entity_t
var EcsFemto* {.importc: "EcsFemto".}: ecs_entity_t
var EcsPico* {.importc: "EcsPico".}: ecs_entity_t
var EcsNano* {.importc: "EcsNano".}: ecs_entity_t
var EcsMicro* {.importc: "EcsMicro".}: ecs_entity_t
var EcsMilli* {.importc: "EcsMilli".}: ecs_entity_t
var EcsCenti* {.importc: "EcsCenti".}: ecs_entity_t
var EcsDeci* {.importc: "EcsDeci".}: ecs_entity_t
var EcsDeca* {.importc: "EcsDeca".}: ecs_entity_t
var EcsHecto* {.importc: "EcsHecto".}: ecs_entity_t
var EcsKilo* {.importc: "EcsKilo".}: ecs_entity_t
var EcsMega* {.importc: "EcsMega".}: ecs_entity_t
var EcsGiga* {.importc: "EcsGiga".}: ecs_entity_t
var EcsTera* {.importc: "EcsTera".}: ecs_entity_t
var EcsPeta* {.importc: "EcsPeta".}: ecs_entity_t
var EcsExa* {.importc: "EcsExa".}: ecs_entity_t
var EcsZetta* {.importc: "EcsZetta".}: ecs_entity_t
var EcsYotta* {.importc: "EcsYotta".}: ecs_entity_t
var EcsKibi* {.importc: "EcsKibi".}: ecs_entity_t
var EcsMebi* {.importc: "EcsMebi".}: ecs_entity_t
var EcsGibi* {.importc: "EcsGibi".}: ecs_entity_t
var EcsTebi* {.importc: "EcsTebi".}: ecs_entity_t
var EcsPebi* {.importc: "EcsPebi".}: ecs_entity_t
var EcsExbi* {.importc: "EcsExbi".}: ecs_entity_t
var EcsZebi* {.importc: "EcsZebi".}: ecs_entity_t
var EcsYobi* {.importc: "EcsYobi".}: ecs_entity_t
var EcsDuration* {.importc: "EcsDuration".}: ecs_entity_t
var EcsPicoSeconds* {.importc: "EcsPicoSeconds".}: ecs_entity_t
var EcsNanoSeconds* {.importc: "EcsNanoSeconds".}: ecs_entity_t
var EcsMicroSeconds* {.importc: "EcsMicroSeconds".}: ecs_entity_t
var EcsMilliSeconds* {.importc: "EcsMilliSeconds".}: ecs_entity_t
var EcsSeconds* {.importc: "EcsSeconds".}: ecs_entity_t
var EcsMinutes* {.importc: "EcsMinutes".}: ecs_entity_t
var EcsHours* {.importc: "EcsHours".}: ecs_entity_t
var EcsDays* {.importc: "EcsDays".}: ecs_entity_t
var EcsTime* {.importc: "EcsTime".}: ecs_entity_t
var EcsDate* {.importc: "EcsDate".}: ecs_entity_t
var EcsMass* {.importc: "EcsMass".}: ecs_entity_t
var EcsGrams* {.importc: "EcsGrams".}: ecs_entity_t
var EcsKiloGrams* {.importc: "EcsKiloGrams".}: ecs_entity_t
var EcsElectricCurrent* {.importc: "EcsElectricCurrent".}: ecs_entity_t
var EcsAmpere* {.importc: "EcsAmpere".}: ecs_entity_t
var EcsAmount* {.importc: "EcsAmount".}: ecs_entity_t
var EcsMole* {.importc: "EcsMole".}: ecs_entity_t
var EcsLuminousIntensity* {.importc: "EcsLuminousIntensity".}: ecs_entity_t
var EcsCandela* {.importc: "EcsCandela".}: ecs_entity_t
var EcsForce* {.importc: "EcsForce".}: ecs_entity_t
var EcsNewton* {.importc: "EcsNewton".}: ecs_entity_t
var EcsLength* {.importc: "EcsLength".}: ecs_entity_t
var EcsMeters* {.importc: "EcsMeters".}: ecs_entity_t
var EcsPicoMeters* {.importc: "EcsPicoMeters".}: ecs_entity_t
var EcsNanoMeters* {.importc: "EcsNanoMeters".}: ecs_entity_t
var EcsMicroMeters* {.importc: "EcsMicroMeters".}: ecs_entity_t
var EcsMilliMeters* {.importc: "EcsMilliMeters".}: ecs_entity_t
var EcsCentiMeters* {.importc: "EcsCentiMeters".}: ecs_entity_t
var EcsKiloMeters* {.importc: "EcsKiloMeters".}: ecs_entity_t
var EcsMiles* {.importc: "EcsMiles".}: ecs_entity_t
var EcsPixels* {.importc: "EcsPixels".}: ecs_entity_t
var EcsPressure* {.importc: "EcsPressure".}: ecs_entity_t
var EcsPascal* {.importc: "EcsPascal".}: ecs_entity_t
var EcsBar* {.importc: "EcsBar".}: ecs_entity_t
var EcsSpeed* {.importc: "EcsSpeed".}: ecs_entity_t
var EcsMetersPerSecond* {.importc: "EcsMetersPerSecond".}: ecs_entity_t
var EcsKiloMetersPerSecond* {.importc: "EcsKiloMetersPerSecond".}: ecs_entity_t
var EcsKiloMetersPerHour* {.importc: "EcsKiloMetersPerHour".}: ecs_entity_t
var EcsMilesPerHour* {.importc: "EcsMilesPerHour".}: ecs_entity_t
var EcsTemperature* {.importc: "EcsTemperature".}: ecs_entity_t
var EcsKelvin* {.importc: "EcsKelvin".}: ecs_entity_t
var EcsCelsius* {.importc: "EcsCelsius".}: ecs_entity_t
var EcsFahrenheit* {.importc: "EcsFahrenheit".}: ecs_entity_t
var EcsData* {.importc: "EcsData".}: ecs_entity_t
var EcsBits* {.importc: "EcsBits".}: ecs_entity_t
var EcsKiloBits* {.importc: "EcsKiloBits".}: ecs_entity_t
var EcsMegaBits* {.importc: "EcsMegaBits".}: ecs_entity_t
var EcsGigaBits* {.importc: "EcsGigaBits".}: ecs_entity_t
var EcsBytes* {.importc: "EcsBytes".}: ecs_entity_t
var EcsKiloBytes* {.importc: "EcsKiloBytes".}: ecs_entity_t
var EcsMegaBytes* {.importc: "EcsMegaBytes".}: ecs_entity_t
var EcsGigaBytes* {.importc: "EcsGigaBytes".}: ecs_entity_t
var EcsKibiBytes* {.importc: "EcsKibiBytes".}: ecs_entity_t
var EcsMebiBytes* {.importc: "EcsMebiBytes".}: ecs_entity_t
var EcsGibiBytes* {.importc: "EcsGibiBytes".}: ecs_entity_t
var EcsDataRate* {.importc: "EcsDataRate".}: ecs_entity_t
var EcsBitsPerSecond* {.importc: "EcsBitsPerSecond".}: ecs_entity_t
var EcsKiloBitsPerSecond* {.importc: "EcsKiloBitsPerSecond".}: ecs_entity_t
var EcsMegaBitsPerSecond* {.importc: "EcsMegaBitsPerSecond".}: ecs_entity_t
var EcsGigaBitsPerSecond* {.importc: "EcsGigaBitsPerSecond".}: ecs_entity_t
var EcsBytesPerSecond* {.importc: "EcsBytesPerSecond".}: ecs_entity_t
var EcsKiloBytesPerSecond* {.importc: "EcsKiloBytesPerSecond".}: ecs_entity_t
var EcsMegaBytesPerSecond* {.importc: "EcsMegaBytesPerSecond".}: ecs_entity_t
var EcsGigaBytesPerSecond* {.importc: "EcsGigaBytesPerSecond".}: ecs_entity_t
var EcsAngle* {.importc: "EcsAngle".}: ecs_entity_t
var EcsRadians* {.importc: "EcsRadians".}: ecs_entity_t
var EcsDegrees* {.importc: "EcsDegrees".}: ecs_entity_t
var EcsFrequency* {.importc: "EcsFrequency".}: ecs_entity_t
var EcsHertz* {.importc: "EcsHertz".}: ecs_entity_t
var EcsKiloHertz* {.importc: "EcsKiloHertz".}: ecs_entity_t
var EcsMegaHertz* {.importc: "EcsMegaHertz".}: ecs_entity_t
var EcsGigaHertz* {.importc: "EcsGigaHertz".}: ecs_entity_t
var EcsUri* {.importc: "EcsUri".}: ecs_entity_t
var EcsUriHyperlink* {.importc: "EcsUriHyperlink".}: ecs_entity_t
var EcsUriImage* {.importc: "EcsUriImage".}: ecs_entity_t
var EcsUriFile* {.importc: "EcsUriFile".}: ecs_entity_t
var EcsColor* {.importc: "EcsColor".}: ecs_entity_t
var EcsColorRgb* {.importc: "EcsColorRgb".}: ecs_entity_t
var EcsColorHsl* {.importc: "EcsColorHsl".}: ecs_entity_t
var EcsColorCss* {.importc: "EcsColorCss".}: ecs_entity_t
var EcsAcceleration* {.importc: "EcsAcceleration".}: ecs_entity_t
var EcsPercentage* {.importc: "EcsPercentage".}: ecs_entity_t
var EcsBel* {.importc: "EcsBel".}: ecs_entity_t
var EcsDeciBel* {.importc: "EcsDeciBel".}: ecs_entity_t
proc FlecsUnitsImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsUnitsImport".}
var FLECS_IDEcsScriptID_private* {.importc: "FLECS_IDEcsScriptID_".}: ecs_entity_t
var EcsScriptTemplate* {.importc: "EcsScriptTemplate".}: ecs_entity_t
var FLECS_IDEcsScriptTemplateID_private* {.
    importc: "FLECS_IDEcsScriptTemplateID_".}: ecs_entity_t
var FLECS_IDEcsScriptConstVarID_private* {.
    importc: "FLECS_IDEcsScriptConstVarID_".}: ecs_entity_t
var FLECS_IDEcsScriptFunctionID_private* {.
    importc: "FLECS_IDEcsScriptFunctionID_".}: ecs_entity_t
var FLECS_IDEcsScriptMethodID_private* {.importc: "FLECS_IDEcsScriptMethodID_".}: ecs_entity_t
var EcsScriptVectorType* {.importc: "EcsScriptVectorType".}: ecs_entity_t
var FLECS_IDEcsScriptVectorTypeID_private*
    {.importc: "FLECS_IDEcsScriptVectorTypeID_".}: ecs_entity_t
proc ecs_script_parse*(world: ptr ecs_world_t; name: cstring; code: cstring;
                       desc: ptr ecs_script_eval_desc_t;
                       result: ptr ecs_script_eval_result_t): ptr ecs_script_t {.
    cdecl, importc: "ecs_script_parse".}
proc ecs_script_eval*(script: ptr ecs_script_t;
                      desc: ptr ecs_script_eval_desc_t;
                      result: ptr ecs_script_eval_result_t): cint {.cdecl,
    importc: "ecs_script_eval".}
proc ecs_script_free*(script: ptr ecs_script_t): void {.cdecl,
    importc: "ecs_script_free".}
proc ecs_script_run*(world: ptr ecs_world_t; name: cstring; code: cstring;
                     result: ptr ecs_script_eval_result_t): cint {.cdecl,
    importc: "ecs_script_run".}
proc ecs_script_run_file*(world: ptr ecs_world_t; filename: cstring): cint {.
    cdecl, importc: "ecs_script_run_file".}
proc ecs_script_runtime_new*(): ptr ecs_script_runtime_t {.cdecl,
    importc: "ecs_script_runtime_new".}
proc ecs_script_runtime_free*(runtime: ptr ecs_script_runtime_t): void {.cdecl,
    importc: "ecs_script_runtime_free".}
proc ecs_script_ast_to_buf*(script: ptr ecs_script_t; buf: ptr ecs_strbuf_t;
                            colors: bool): cint {.cdecl,
    importc: "ecs_script_ast_to_buf".}
proc ecs_script_ast_to_str*(script: ptr ecs_script_t; colors: bool): cstring {.
    cdecl, importc: "ecs_script_ast_to_str".}
proc ecs_script_init*(world: ptr ecs_world_t; desc: ptr ecs_script_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_script_init".}
proc ecs_script_update*(world: ptr ecs_world_t; script: ecs_entity_t;
                        instance: ecs_entity_t; code: cstring): cint {.cdecl,
    importc: "ecs_script_update".}
proc ecs_script_clear*(world: ptr ecs_world_t; script: ecs_entity_t;
                       instance: ecs_entity_t): void {.cdecl,
    importc: "ecs_script_clear".}
proc ecs_script_vars_init*(world: ptr ecs_world_t): ptr ecs_script_vars_t {.
    cdecl, importc: "ecs_script_vars_init".}
proc ecs_script_vars_fini*(vars: ptr ecs_script_vars_t): void {.cdecl,
    importc: "ecs_script_vars_fini".}
proc ecs_script_vars_push*(parent: ptr ecs_script_vars_t): ptr ecs_script_vars_t {.
    cdecl, importc: "ecs_script_vars_push".}
proc ecs_script_vars_pop*(vars: ptr ecs_script_vars_t): ptr ecs_script_vars_t {.
    cdecl, importc: "ecs_script_vars_pop".}
proc ecs_script_vars_declare*(vars: ptr ecs_script_vars_t; name: cstring): ptr ecs_script_var_t {.
    cdecl, importc: "ecs_script_vars_declare".}
proc ecs_script_vars_define_id*(vars: ptr ecs_script_vars_t; name: cstring;
                                type_arg: ecs_entity_t): ptr ecs_script_var_t {.
    cdecl, importc: "ecs_script_vars_define_id".}
proc ecs_script_vars_lookup*(vars: ptr ecs_script_vars_t; name: cstring): ptr ecs_script_var_t {.
    cdecl, importc: "ecs_script_vars_lookup".}
proc ecs_script_vars_from_sp*(vars: ptr ecs_script_vars_t; sp: int32): ptr ecs_script_var_t {.
    cdecl, importc: "ecs_script_vars_from_sp".}
proc ecs_script_vars_print*(vars: ptr ecs_script_vars_t): void {.cdecl,
    importc: "ecs_script_vars_print".}
proc ecs_script_vars_set_size*(vars: ptr ecs_script_vars_t; count: int32): void {.
    cdecl, importc: "ecs_script_vars_set_size".}
proc ecs_script_vars_from_iter*(it: ptr ecs_iter_t; vars: ptr ecs_script_vars_t;
                                offset: cint): void {.cdecl,
    importc: "ecs_script_vars_from_iter".}
proc ecs_expr_run*(world: ptr ecs_world_t; ptr_arg: cstring;
                   value: ptr ecs_value_t; desc: ptr ecs_expr_eval_desc_t): cstring {.
    cdecl, importc: "ecs_expr_run".}
proc ecs_expr_parse*(world: ptr ecs_world_t; expr: cstring;
                     desc: ptr ecs_expr_eval_desc_t): ptr ecs_script_t {.cdecl,
    importc: "ecs_expr_parse".}
proc ecs_expr_eval*(script: ptr ecs_script_t; value: ptr ecs_value_t;
                    desc: ptr ecs_expr_eval_desc_t): cint {.cdecl,
    importc: "ecs_expr_eval".}
proc ecs_script_string_interpolate*(world: ptr ecs_world_t; str: cstring;
                                    vars: ptr ecs_script_vars_t): cstring {.
    cdecl, importc: "ecs_script_string_interpolate".}
proc ecs_const_var_init*(world: ptr ecs_world_t; desc: ptr ecs_const_var_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_const_var_init".}
proc ecs_const_var_get*(world: ptr ecs_world_t; var_arg: ecs_entity_t): ecs_value_t {.
    cdecl, importc: "ecs_const_var_get".}
proc ecs_function_init*(world: ptr ecs_world_t; desc: ptr ecs_function_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_function_init".}
proc ecs_method_init*(world: ptr ecs_world_t; desc: ptr ecs_function_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_method_init".}
proc ecs_ptr_to_expr*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                      data: pointer): cstring {.cdecl,
    importc: "ecs_ptr_to_expr".}
proc ecs_ptr_to_expr_buf*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                          data: pointer; buf: ptr ecs_strbuf_t): cint {.cdecl,
    importc: "ecs_ptr_to_expr_buf".}
proc ecs_ptr_to_str*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                     data: pointer): cstring {.cdecl, importc: "ecs_ptr_to_str".}
proc ecs_ptr_to_str_buf*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                         data: pointer; buf: ptr ecs_strbuf_t): cint {.cdecl,
    importc: "ecs_ptr_to_str_buf".}
proc FlecsScriptImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsScriptImport".}
var FLECS_IDEcsDocDescriptionID_private* {.
    importc: "FLECS_IDEcsDocDescriptionID_".}: ecs_entity_t
var EcsDocUuid* {.importc: "EcsDocUuid".}: ecs_entity_t
var EcsDocBrief* {.importc: "EcsDocBrief".}: ecs_entity_t
var EcsDocDetail* {.importc: "EcsDocDetail".}: ecs_entity_t
var EcsDocLink* {.importc: "EcsDocLink".}: ecs_entity_t
var EcsDocColor* {.importc: "EcsDocColor".}: ecs_entity_t
proc ecs_doc_set_uuid*(world: ptr ecs_world_t; entity: ecs_entity_t;
                       uuid: cstring): void {.cdecl, importc: "ecs_doc_set_uuid".}
proc ecs_doc_set_name*(world: ptr ecs_world_t; entity: ecs_entity_t;
                       name: cstring): void {.cdecl, importc: "ecs_doc_set_name".}
proc ecs_doc_set_brief*(world: ptr ecs_world_t; entity: ecs_entity_t;
                        description: cstring): void {.cdecl,
    importc: "ecs_doc_set_brief".}
proc ecs_doc_set_detail*(world: ptr ecs_world_t; entity: ecs_entity_t;
                         description: cstring): void {.cdecl,
    importc: "ecs_doc_set_detail".}
proc ecs_doc_set_link*(world: ptr ecs_world_t; entity: ecs_entity_t;
                       link: cstring): void {.cdecl, importc: "ecs_doc_set_link".}
proc ecs_doc_set_color*(world: ptr ecs_world_t; entity: ecs_entity_t;
                        color: cstring): void {.cdecl,
    importc: "ecs_doc_set_color".}
proc ecs_doc_get_uuid*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_uuid".}
proc ecs_doc_get_name*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_name".}
proc ecs_doc_get_brief*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_brief".}
proc ecs_doc_get_detail*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_detail".}
proc ecs_doc_get_link*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_link".}
proc ecs_doc_get_color*(world: ptr ecs_world_t; entity: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_doc_get_color".}
proc FlecsDocImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsDocImport".}
var FLECS_IDEcsTypeID_private* {.importc: "FLECS_IDEcsTypeID_".}: ecs_entity_t
var FLECS_IDEcsTypeSerializerID_private* {.
    importc: "FLECS_IDEcsTypeSerializerID_".}: ecs_entity_t
var FLECS_IDEcsPrimitiveID_private* {.importc: "FLECS_IDEcsPrimitiveID_".}: ecs_entity_t
var FLECS_IDEcsEnumID_private* {.importc: "FLECS_IDEcsEnumID_".}: ecs_entity_t
var FLECS_IDEcsBitmaskID_private* {.importc: "FLECS_IDEcsBitmaskID_".}: ecs_entity_t
var FLECS_IDEcsConstantsID_private* {.importc: "FLECS_IDEcsConstantsID_".}: ecs_entity_t
var FLECS_IDEcsMemberID_private* {.importc: "FLECS_IDEcsMemberID_".}: ecs_entity_t
var FLECS_IDEcsMemberRangesID_private* {.importc: "FLECS_IDEcsMemberRangesID_".}: ecs_entity_t
var FLECS_IDEcsStructID_private* {.importc: "FLECS_IDEcsStructID_".}: ecs_entity_t
var FLECS_IDEcsArrayID_private* {.importc: "FLECS_IDEcsArrayID_".}: ecs_entity_t
var FLECS_IDEcsVectorID_private* {.importc: "FLECS_IDEcsVectorID_".}: ecs_entity_t
var FLECS_IDEcsOpaqueID_private* {.importc: "FLECS_IDEcsOpaqueID_".}: ecs_entity_t
var FLECS_IDEcsUnitID_private* {.importc: "FLECS_IDEcsUnitID_".}: ecs_entity_t
var FLECS_IDEcsUnitPrefixID_private* {.importc: "FLECS_IDEcsUnitPrefixID_".}: ecs_entity_t
var EcsQuantity* {.importc: "EcsQuantity".}: ecs_entity_t
var FLECS_IDecs_bool_tID_private* {.importc: "FLECS_IDecs_bool_tID_".}: ecs_entity_t
var FLECS_IDecs_char_tID_private* {.importc: "FLECS_IDecs_char_tID_".}: ecs_entity_t
var FLECS_IDecs_byte_tID_private* {.importc: "FLECS_IDecs_byte_tID_".}: ecs_entity_t
var FLECS_IDecs_u8_tID_private* {.importc: "FLECS_IDecs_u8_tID_".}: ecs_entity_t
var FLECS_IDecs_u16_tID_private* {.importc: "FLECS_IDecs_u16_tID_".}: ecs_entity_t
var FLECS_IDecs_u32_tID_private* {.importc: "FLECS_IDecs_u32_tID_".}: ecs_entity_t
var FLECS_IDecs_u64_tID_private* {.importc: "FLECS_IDecs_u64_tID_".}: ecs_entity_t
var FLECS_IDecs_uptr_tID_private* {.importc: "FLECS_IDecs_uptr_tID_".}: ecs_entity_t
var FLECS_IDecs_i8_tID_private* {.importc: "FLECS_IDecs_i8_tID_".}: ecs_entity_t
var FLECS_IDecs_i16_tID_private* {.importc: "FLECS_IDecs_i16_tID_".}: ecs_entity_t
var FLECS_IDecs_i32_tID_private* {.importc: "FLECS_IDecs_i32_tID_".}: ecs_entity_t
var FLECS_IDecs_i64_tID_private* {.importc: "FLECS_IDecs_i64_tID_".}: ecs_entity_t
var FLECS_IDecs_iptr_tID_private* {.importc: "FLECS_IDecs_iptr_tID_".}: ecs_entity_t
var FLECS_IDecs_f32_tID_private* {.importc: "FLECS_IDecs_f32_tID_".}: ecs_entity_t
var FLECS_IDecs_f64_tID_private* {.importc: "FLECS_IDecs_f64_tID_".}: ecs_entity_t
var FLECS_IDecs_string_tID_private* {.importc: "FLECS_IDecs_string_tID_".}: ecs_entity_t
var FLECS_IDecs_entity_tID_private* {.importc: "FLECS_IDecs_entity_tID_".}: ecs_entity_t
var FLECS_IDecs_id_tID_private* {.importc: "FLECS_IDecs_id_tID_".}: ecs_entity_t
proc ecs_meta_serializer_to_str*(world: ptr ecs_world_t; type_arg: ecs_entity_t): cstring {.
    cdecl, importc: "ecs_meta_serializer_to_str".}
proc ecs_meta_cursor*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                      ptr_arg: pointer): ecs_meta_cursor_t {.cdecl,
    importc: "ecs_meta_cursor".}
proc ecs_meta_get_ptr*(cursor: ptr ecs_meta_cursor_t): pointer {.cdecl,
    importc: "ecs_meta_get_ptr".}
proc ecs_meta_next*(cursor: ptr ecs_meta_cursor_t): cint {.cdecl,
    importc: "ecs_meta_next".}
proc ecs_meta_elem*(cursor: ptr ecs_meta_cursor_t; elem: int32): cint {.cdecl,
    importc: "ecs_meta_elem".}
proc ecs_meta_member*(cursor: ptr ecs_meta_cursor_t; name: cstring): cint {.
    cdecl, importc: "ecs_meta_member".}
proc ecs_meta_try_member*(cursor: ptr ecs_meta_cursor_t; name: cstring): cint {.
    cdecl, importc: "ecs_meta_try_member".}
proc ecs_meta_dotmember*(cursor: ptr ecs_meta_cursor_t; name: cstring): cint {.
    cdecl, importc: "ecs_meta_dotmember".}
proc ecs_meta_try_dotmember*(cursor: ptr ecs_meta_cursor_t; name: cstring): cint {.
    cdecl, importc: "ecs_meta_try_dotmember".}
proc ecs_meta_push*(cursor: ptr ecs_meta_cursor_t): cint {.cdecl,
    importc: "ecs_meta_push".}
proc ecs_meta_pop*(cursor: ptr ecs_meta_cursor_t): cint {.cdecl,
    importc: "ecs_meta_pop".}
proc ecs_meta_is_collection*(cursor: ptr ecs_meta_cursor_t): bool {.cdecl,
    importc: "ecs_meta_is_collection".}
proc ecs_meta_get_type*(cursor: ptr ecs_meta_cursor_t): ecs_entity_t {.cdecl,
    importc: "ecs_meta_get_type".}
proc ecs_meta_get_unit*(cursor: ptr ecs_meta_cursor_t): ecs_entity_t {.cdecl,
    importc: "ecs_meta_get_unit".}
proc ecs_meta_get_member*(cursor: ptr ecs_meta_cursor_t): cstring {.cdecl,
    importc: "ecs_meta_get_member".}
proc ecs_meta_get_member_id*(cursor: ptr ecs_meta_cursor_t): ecs_entity_t {.
    cdecl, importc: "ecs_meta_get_member_id".}
proc ecs_meta_set_bool*(cursor: ptr ecs_meta_cursor_t; value: bool): cint {.
    cdecl, importc: "ecs_meta_set_bool".}
proc ecs_meta_set_char*(cursor: ptr ecs_meta_cursor_t; value: cschar): cint {.
    cdecl, importc: "ecs_meta_set_char".}
proc ecs_meta_set_int*(cursor: ptr ecs_meta_cursor_t; value: int64): cint {.
    cdecl, importc: "ecs_meta_set_int".}
proc ecs_meta_set_uint*(cursor: ptr ecs_meta_cursor_t; value: uint64): cint {.
    cdecl, importc: "ecs_meta_set_uint".}
proc ecs_meta_set_float*(cursor: ptr ecs_meta_cursor_t; value: cdouble): cint {.
    cdecl, importc: "ecs_meta_set_float".}
proc ecs_meta_set_string*(cursor: ptr ecs_meta_cursor_t; value: cstring): cint {.
    cdecl, importc: "ecs_meta_set_string".}
proc ecs_meta_set_string_literal*(cursor: ptr ecs_meta_cursor_t; value: cstring): cint {.
    cdecl, importc: "ecs_meta_set_string_literal".}
proc ecs_meta_set_entity*(cursor: ptr ecs_meta_cursor_t; value: ecs_entity_t): cint {.
    cdecl, importc: "ecs_meta_set_entity".}
proc ecs_meta_set_id*(cursor: ptr ecs_meta_cursor_t; value: ecs_id_t): cint {.
    cdecl, importc: "ecs_meta_set_id".}
proc ecs_meta_set_null*(cursor: ptr ecs_meta_cursor_t): cint {.cdecl,
    importc: "ecs_meta_set_null".}
proc ecs_meta_set_value*(cursor: ptr ecs_meta_cursor_t; value: ptr ecs_value_t): cint {.
    cdecl, importc: "ecs_meta_set_value".}
proc ecs_meta_get_bool*(cursor: ptr ecs_meta_cursor_t): bool {.cdecl,
    importc: "ecs_meta_get_bool".}
proc ecs_meta_get_char*(cursor: ptr ecs_meta_cursor_t): cschar {.cdecl,
    importc: "ecs_meta_get_char".}
proc ecs_meta_get_int*(cursor: ptr ecs_meta_cursor_t): int64 {.cdecl,
    importc: "ecs_meta_get_int".}
proc ecs_meta_get_uint*(cursor: ptr ecs_meta_cursor_t): uint64 {.cdecl,
    importc: "ecs_meta_get_uint".}
proc ecs_meta_get_float*(cursor: ptr ecs_meta_cursor_t): cdouble {.cdecl,
    importc: "ecs_meta_get_float".}
proc ecs_meta_get_string*(cursor: ptr ecs_meta_cursor_t): cstring {.cdecl,
    importc: "ecs_meta_get_string".}
proc ecs_meta_get_entity*(cursor: ptr ecs_meta_cursor_t): ecs_entity_t {.cdecl,
    importc: "ecs_meta_get_entity".}
proc ecs_meta_get_id*(cursor: ptr ecs_meta_cursor_t): ecs_id_t {.cdecl,
    importc: "ecs_meta_get_id".}
proc ecs_meta_ptr_to_float*(type_kind: ecs_primitive_kind_t; ptr_arg: pointer): cdouble {.
    cdecl, importc: "ecs_meta_ptr_to_float".}
proc ecs_meta_op_get_elem_count*(op: ptr ecs_meta_op_t; ptr_arg: pointer): ecs_size_t {.
    cdecl, importc: "ecs_meta_op_get_elem_count".}
proc ecs_primitive_init*(world: ptr ecs_world_t; desc: ptr ecs_primitive_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_primitive_init".}
proc ecs_enum_init*(world: ptr ecs_world_t; desc: ptr ecs_enum_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_enum_init".}
proc ecs_bitmask_init*(world: ptr ecs_world_t; desc: ptr ecs_bitmask_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_bitmask_init".}
proc ecs_array_init*(world: ptr ecs_world_t; desc: ptr ecs_array_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_array_init".}
proc ecs_vector_init*(world: ptr ecs_world_t; desc: ptr ecs_vector_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_vector_init".}
proc ecs_struct_init*(world: ptr ecs_world_t; desc: ptr ecs_struct_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_struct_init".}
proc ecs_struct_add_member*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                            member: ptr ecs_member_t): cint {.cdecl,
    importc: "ecs_struct_add_member".}
proc ecs_struct_get_member*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                            name: cstring): ptr ecs_member_t {.cdecl,
    importc: "ecs_struct_get_member".}
proc ecs_struct_get_nth_member*(world: ptr ecs_world_t; type_arg: ecs_entity_t;
                                i: int32): ptr ecs_member_t {.cdecl,
    importc: "ecs_struct_get_nth_member".}
proc ecs_opaque_init*(world: ptr ecs_world_t; desc: ptr ecs_opaque_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_opaque_init".}
proc ecs_unit_init*(world: ptr ecs_world_t; desc: ptr ecs_unit_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_unit_init".}
proc ecs_unit_prefix_init*(world: ptr ecs_world_t;
                           desc: ptr ecs_unit_prefix_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_unit_prefix_init".}
proc ecs_quantity_init*(world: ptr ecs_world_t; desc: ptr ecs_entity_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_quantity_init".}
proc FlecsMetaImport*(world: ptr ecs_world_t): void {.cdecl,
    importc: "FlecsMetaImport".}
proc ecs_meta_from_desc*(world: ptr ecs_world_t; component: ecs_entity_t;
                         kind: ecs_type_kind_t; desc: cstring): cint {.cdecl,
    importc: "ecs_meta_from_desc".}
proc ecs_set_os_api_impl*(): void {.cdecl, importc: "ecs_set_os_api_impl".}
proc ecs_import*(world: ptr ecs_world_t; module: ecs_module_action_t;
                 module_name: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_import".}
proc ecs_import_c*(world: ptr ecs_world_t; module: ecs_module_action_t;
                   module_name_c: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_import_c".}
proc ecs_import_from_library*(world: ptr ecs_world_t; library_name: cstring;
                              module_name: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_import_from_library".}
proc ecs_module_init*(world: ptr ecs_world_t; c_name: cstring;
                      desc: ptr ecs_component_desc_t): ecs_entity_t {.cdecl,
    importc: "ecs_module_init".}
proc ecs_cpp_get_type_name*(type_name: cstring; func_name: cstring;
                            len: csize_t; front_len: csize_t): cstring {.cdecl,
    importc: "ecs_cpp_get_type_name".}
proc ecs_cpp_get_symbol_name*(symbol_name: cstring; type_name: cstring;
                              len: csize_t): cstring {.cdecl,
    importc: "ecs_cpp_get_symbol_name".}
proc ecs_cpp_get_constant_name*(constant_name: cstring; func_name: cstring;
                                len: csize_t; back_len: csize_t): cstring {.
    cdecl, importc: "ecs_cpp_get_constant_name".}
proc ecs_cpp_trim_module*(world: ptr ecs_world_t; type_name: cstring): cstring {.
    cdecl, importc: "ecs_cpp_trim_module".}
proc ecs_cpp_component_register*(world: ptr ecs_world_t;
                                 desc: ptr ecs_cpp_component_desc_t): ecs_entity_t {.
    cdecl, importc: "ecs_cpp_component_register".}
proc ecs_cpp_enum_init*(world: ptr ecs_world_t; id: ecs_entity_t;
                        underlying_type: ecs_entity_t): void {.cdecl,
    importc: "ecs_cpp_enum_init".}
proc ecs_cpp_enum_constant_register*(world: ptr ecs_world_t;
                                     parent: ecs_entity_t; id: ecs_entity_t;
                                     name: cstring; value: pointer;
                                     value_type: ecs_entity_t;
                                     value_size: csize_t): ecs_entity_t {.cdecl,
    importc: "ecs_cpp_enum_constant_register".}
proc ecs_cpp_set*(world: ptr ecs_world_t; entity: ecs_entity_t;
                  component: ecs_id_t; new_ptr: pointer; size: csize_t): ecs_cpp_get_mut_t {.
    cdecl, importc: "ecs_cpp_set".}
proc ecs_cpp_assign*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     component: ecs_id_t; new_ptr: pointer; size: csize_t): ecs_cpp_get_mut_t {.
    cdecl, importc: "ecs_cpp_assign".}
proc ecs_cpp_new*(world: ptr ecs_world_t; parent: ecs_entity_t; name: cstring;
                  sep: cstring; root_sep: cstring): ecs_entity_t {.cdecl,
    importc: "ecs_cpp_new".}
proc ecs_cpp_last_member*(world: ptr ecs_world_t; type_arg: ecs_entity_t): ptr ecs_member_t {.
    cdecl, importc: "ecs_cpp_last_member".}
