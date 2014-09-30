#include <bindings.dsl.h>
#include <lxc/attach_options.h>

-----------------------------------------------------------------------------
-- |
-- Module      :  Bindings.LXC.AttachOptions
-- Copyright   :  (c) Nickolay Kudasov 2014
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  nickolay.kudasov@gmail.com
--
-- Options and structures to run commands inside LXC containers.
-- You can get more info about LXC at <https://help.ubuntu.com/lts/serverguide/lxc.html> and <https://linuxcontainers.org>.
--
-----------------------------------------------------------------------------
module Bindings.LXC.AttachOptions (
  -- * Attach env policy
  c'LXC_ATTACH_KEEP_ENV,
  c'LXC_ATTACH_CLEAR_ENV,
  -- * Attach flags
  c'LXC_ATTACH_MOVE_TO_CGROUP,
  c'LXC_ATTACH_DROP_CAPABILITIES,
  c'LXC_ATTACH_SET_PERSONALITY,
  c'LXC_ATTACH_LSM_EXEC,
  c'LXC_ATTACH_REMOUNT_PROC_SYS,
  c'LXC_ATTACH_LSM_NOW,
  c'LXC_ATTACH_DEFAULT,
  c'LXC_ATTACH_LSM,
  -- * Attach options
  C'lxc_attach_options_t(..),
  p'lxc_attach_options_t'attach_flags,
  p'lxc_attach_options_t'namespaces,
  p'lxc_attach_options_t'personality,
  p'lxc_attach_options_t'initial_cwd,
  p'lxc_attach_options_t'uid,
  p'lxc_attach_options_t'gid,
  p'lxc_attach_options_t'env_policy,
  p'lxc_attach_options_t'extra_env_vars,
  p'lxc_attach_options_t'extra_keep_env,
  p'lxc_attach_options_t'stdin_fd,
  p'lxc_attach_options_t'stdout_fd,
  p'lxc_attach_options_t'stderr_fd,
  -- * Attach command
  C'lxc_attach_command_t(..),
  p'lxc_attach_command_t'program,
  p'lxc_attach_command_t'argv,
  -- * Attach @exec@ functions
  C_lxc_attach_exec_t(..),
  c'lxc_attach_run_command,
  p'lxc_attach_run_command,
  c'lxc_attach_run_shell,
  p'lxc_attach_run_shell,
) where
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

