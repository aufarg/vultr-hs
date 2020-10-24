{-# LANGUAGE DeriveGeneric #-}
module Vultr.Data.Server
(
Server(..)
) where

import Data.Aeson.Types
import Data.List
import Data.Text
import GHC.Generics

data Server = Server
  { status :: Text
  , tag :: Text
  , main_ip :: Text
  } deriving (Show,Generic)

instance FromJSON Server
instance ToJSON Server
