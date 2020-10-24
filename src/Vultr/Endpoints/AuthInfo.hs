{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Vultr.Endpoints.AuthInfo
    ( authInfo
    ) where

import Vultr.Data.AuthInfo
import Vultr.Data.Request
import Vultr.Auth

authInfo :: Request Authenticated k AuthInfo
authInfo = Get ["auth", "info"] []
