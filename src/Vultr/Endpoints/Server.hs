{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Vultr.Endpoints.Server
    ( serverList
    ) where

import Vultr.Data.Application
import Vultr.Data.Request
import Vultr.Data.Server
import Vultr.Auth
import Data.Map.Strict

appChangeList :: QueryParameters -> Request Authenticated k Application
appChangeList = Get ["server", "app_change_list"]

serverList :: Request Authenticated k (Map String Server)
serverList = Get ["server", "list"] []

serverGet :: QueryParameters -> Request Authenticated k Server
serverGet = Get ["server", "list"]
