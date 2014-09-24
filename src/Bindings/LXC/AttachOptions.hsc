#include <bindings.dsl.h>
#include <lxc/attach_options.h>

module Bindings.LXC.AttachOptions where
#strict_import
import Bindings.LXC.Sys.Types

type C_lxc_attach_exec_t = FunPtr (Ptr () -> IO CInt)

#integral_t lxc_attach_env_policy_t

#num LXC_ATTACH_KEEP_ENV
#num LXC_ATTACH_CLEAR_ENV

#num LXC_ATTACH_MOVE_TO_CGROUP
#num LXC_ATTACH_DROP_CAPABILITIES
#num LXC_ATTACH_SET_PERSONALITY
#num LXC_ATTACH_LSM_EXEC
#num LXC_ATTACH_REMOUNT_PROC_SYS
#num LXC_ATTACH_LSM_NOW
#num LXC_ATTACH_DEFAULT

#num LXC_ATTACH_LSM

#starttype lxc_attach_options_t
#field attach_flags             , CInt
#field namespaces               , CInt
#field personality              , CLong
#field initial_cwd              , CString
#field uid                      , <uid_t>
#field gid                      , <gid_t>
#field env_policy               , <lxc_attach_env_policy_t>
#field extra_env_vars           , Ptr CString
#field extra_keep_env           , Ptr CString
#field stdin_fd                 , CInt
#field stdout_fd                , CInt
#field stderr_fd                , CInt
#stoptype

#starttype lxc_attach_command_t
#field program                  , CString
#field argv                     , Ptr CString
#stoptype

#ccall lxc_attach_run_command   , Ptr () -> IO CInt
#ccall lxc_attach_run_shell     , Ptr () -> IO CInt

