#include <bindings.dsl.h>
#include <lxc/lxccontainer.h>

module Bindings.LXC.Types where
#strict_import

type CBool = CInt

#num LXC_CLONE_KEEPNAME
#num LXC_CLONE_KEEPMACADDR
#num LXC_CLONE_SNAPSHOT
#num LXC_CLONE_KEEPBDEVTYPE
#num LXC_CLONE_MAYBE_SNAPSHOT
#num LXC_CLONE_MAXFLAGS
#num LXC_CREATE_QUIET
#num LXC_CREATE_MAXFLAGS

#starttype bdev_specs
#field fstype                   , CString
#stoptype

#starttype lxc_snapshot
#field name                     , CString
#field comment_pathname         , CString
#field timestamp                , CString
#field lxcpath                  , CString
#field free                     , FunPtr (<lxc_snapshot> -> IO ())
#stoptype

#starttype lxc_lock
#stoptype

#starttype lxc_container
#field name                     , CString
#field configfile               , CString
#field pidfile                  , CString
#field slock                    , Ptr <lxc_lock>
#field privlock                 , Ptr <lxc_lock>
#field numthreads               , CInt
#field lxc_conf                 , Ptr <lxc_conf>
#field error_string             , CString
#field error_num                , CInt
#field daemonize                , CBool
#field config_path              , CString
#field is_defined               , FunPtr (Ptr <lxc_container> -> IO CBool)
#field state                    , FunPtr (Ptr <lxc_container> -> IO CString)
#field is_running               , FunPtr (Ptr <lxc_container> -> IO CBool)
#field freeze                   , FunPtr (Ptr <lxc_container> -> IO CBool)
#field unfreeze                 , FunPtr (Ptr <lxc_container> -> IO CBool)
#field init_pid                 , FunPtr (Ptr <lxc_container> -> IO <pid_t>)
#field load_config              , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field start                    , FunPtr (Ptr <lxc_container> -> CInt -> Ptr CString -> IO CBool)
#field stop                     , FunPtr (Ptr <lxc_container> -> IO CBool)
#field want_daemonize           , FunPtr (Ptr <lxc_container> -> CBool -> IO CBool)
#field want_close_all_fds       , FunPtr (Ptr <lxc_container> -> CBool -> IO CBool)
#field config_file_name         , FunPtr (Ptr <lxc_container> -> IO CString)
#field wait                     , FunPtr (Ptr <lxc_container> -> CString -> CInt -> IO CBool)
#field set_config_item          , FunPtr (Ptr <lxc_container> -> CString -> CString -> IO CBool)
#field destroy                  , FunPtr (Ptr <lxc_container> -> IO CBool)
#field destroy_with_snapshots   , FunPtr (Ptr <lxc_container> -> IO CBool)
#field save_config              , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field create                   , FunPtr (Ptr <lxc_container> -> CString -> CString -> <bdev_specs> -> CInt -> Ptr CString -> IO CBool)
#field rename                   , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field reboot                   , FunPtr (Ptr <lxc_container> -> IO CBool)
#field shutdown                 , FunPtr (Ptr <lxc_container> -> CInt -> IO CBool)
#field clear_config             , FunPtr (Ptr <lxc_container> -> IO CBool)
#field clear_config_item        , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field get_config_item          , FunPtr (Ptr <lxc_container> -> CString -> CString -> CInt -> IO CInt)
#field get_running_config_item  , FunPtr (Ptr <lxc_container> -> CString -> IO CString)
#field get_keys                 , FunPtr (Ptr <lxc_container> -> CString -> CString -> CInt -> IO CInt)
#field get_interfaces           , FunPtr (Ptr <lxc_container> -> IO (Ptr CString))
#field get_ips                  , FunPtr (Ptr <lxc_container> -> CString -> CString -> CInt -> IO (Ptr CString))
#field get_cgroup_item          , FunPtr (Ptr <lxc_container> -> CString -> Ptr CChar -> CInt -> IO CInt)
#field set_cgroup_item          , FunPtr (Ptr <lxc_container> -> CString -> CString -> IO CBool)
#field get_config_path          , FunPtr (Ptr <lxc_container> -> IO CString)
#field set_config_path          , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field clone                    , FunPtr (Ptr <lxc_container> -> CString -> CString -> CInt -> CString -> CString -> <uint62_t> -> Ptr CString -> IO (Ptr <lxc_container>))
#field console_getfd            , FunPtr (Ptr <lxc_container> -> Ptr CInt -> Ptr CInt -> IO CInt)
#field console                  , FunPtr (Ptr <lxc_container> -> CInt -> CInt -> CInt -> CInt -> CInt -> IO CInt)
#field attach                   , FunPtr (Ptr <lxc_container> -> Ptr <lxc_attach_exec_t> -> Ptr () -> Ptr <lxc_attach_options_t> -> Ptr <pid_t> -> IO CInt)
#field attach_run_wait          , FunPtr (Ptr <lxc_container> -> Ptr <lxc_attach_options_t> -> CString -> Ptr CString -> IO CInt)
#field snapshot                 , FunPtr (Ptr <lxc_container> -> CString -> IO CInt)
#field snapshot_list            , FunPtr (Ptr <lxc_container> -> Ptr (Ptr <lxc_snapshot>) -> IO CInt)
#field snapshot_restore         , FunPtr (Ptr <lxc_container> -> CString -> CString -> IO CBool)
#field snapshot_destroy         , FunPtr (Ptr <lxc_container> -> CString -> IO CBool)
#field snapshot_destroy_all     , FunPtr (Ptr <lxc_container> -> IO CBool)
#field may_control              , FunPtr (Ptr <lxc_container> -> IO CBool)
#field add_device_node          , FunPtr (Ptr <lxc_container> -> CString -> CString -> IO CBool)
#field remove_device_node       , FunPtr (Ptr <lxc_container> -> CString -> CString -> IO CBool)
#field chekpoint                , FunPtr (Ptr <lxc_container> -> CString -> CBool -> CBool -> IO CBool)
#field restore                  , FunPtr (Ptr <lxc_container> -> CString -> CBool -> IO CBool)
#stoptype

#ccall lxc_container_new          , CString -> CString -> IO (Ptr <lxc_container>)
#ccall lxc_container_get          , Ptr <lxc_container> -> IO CInt
#ccall lxc_container_put          , Ptr <lxc_container> -> IO CInt
#ccall get_wait_states            , Ptr CString -> IO CInt
#ccall lxc_get_global_config_item , CString -> IO CString
#ccall lxc_get_version            , IO CString
#ccall list_defined_containers    , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <lxc_container>))
#ccall list_active_containers     , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <lxc_container>))
#ccall list_all_containers        , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <lxc_container>))
#ccall lxc_log_close              , IO ()

