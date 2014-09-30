#include <bindings.dsl.h>
#include <stdlib.h>
#include <stdint.h>

-----------------------------------------------------------------------------
-- |
-- Module      :  Bindings.LXC.Sys.Types
-- Copyright   :  (c) Nickolay Kudasov 2014
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  nickolay.kudasov@gmail.com
--
-- System types from standard C library.
--
-----------------------------------------------------------------------------
module Bindings.LXC.Sys.Types where
#strict_import

type CBool = CInt

#integral_t pid_t
#integral_t uint64_t
#integral_t uid_t
#integral_t gid_t
