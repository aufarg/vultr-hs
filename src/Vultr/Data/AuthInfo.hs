{-# LANGUAGE DeriveGeneric #-}
module Vultr.Data.AuthInfo
(
AuthInfo(..)
) where

import Data.Aeson.Types
import Data.Text
import GHC.Generics

data AuthInfo = AuthInfo
  { acls :: [Text]
  , email :: Text
  , name :: Text
  } deriving (Show,Generic)

instance FromJSON AuthInfo
instance ToJSON AuthInfo
