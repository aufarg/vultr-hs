{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}

module Vultr.Data.Request where

import qualified Data.ByteString as BS
import Data.Text
import Vultr.Auth

data Access
    = Authenticated
    | Anonymous

data ContentType
    = CTJson

type Path = [Text]

type QueryParameters = [QueryParameter]

type QueryParameter = (Text, Text)

type RequestBody = BS.ByteString

data Request (ac :: Access) (ct :: ContentType) a
    = Get Path QueryParameters
    | Post Path RequestBody
