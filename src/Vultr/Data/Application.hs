{-# LANGUAGE DeriveGeneric #-}
module Vultr.Data.Application
(
Application(..)
) where

import Data.Aeson.Types
import Data.Text
import GHC.Generics

data Application = Application
  { name :: Text
  , short_name :: Text
  , deploy_name :: Text
  } deriving (Show,Generic)

instance FromJSON Application
instance ToJSON Application
