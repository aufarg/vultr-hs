{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Vultr.Endpoints.Application
    ( appList
    ) where

import Vultr.Data.Application
import Vultr.Data.Request
import Vultr.Auth

appList :: Request Authenticated k Application
appList = Get ["app", "list"] []
