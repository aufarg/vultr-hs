{-# LANGUAGE OverloadedStrings #-}

module Vultr.Auth
where

import Network.Wreq(Options, header)
import Data.ByteString
import Control.Lens

type Token = ByteString

data Auth
    = VultrAuth Token
