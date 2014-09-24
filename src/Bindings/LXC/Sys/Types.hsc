#include <bindings.dsl.h>
#include <stdlib.h>
#include <stdint.h>

module Bindings.LXC.Sys.Types where
#strict_import

type CBool = CInt

#integral_t pid_t
#integral_t uint64_t
#integral_t uid_t
#integral_t gid_t
