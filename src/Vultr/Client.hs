{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module Vultr.Client where

import Control.Lens
import qualified Data.Aeson.Types as Aeson
import qualified Data.ByteString.Lazy as BS
import qualified Data.Text as T
import Network.Wreq hiding (Auth)
import Vultr.Auth
import Vultr.Data

class OptionSetter a where
    setOpt :: a -> Options -> Options

instance OptionSetter Auth where
    setOpt (VultrAuth t) = header "API-Key" .~ [t]

instance OptionSetter QueryParameters where
    setOpt qs = foldr (.) id $ map setOpt qs

instance OptionSetter QueryParameter where
    setOpt (k, v) = param k .~ [v]

instance OptionSetter ContentType where
    setOpt ct = header "Content-Type" .~ [t]
      where
        t =
            case ct of
                CTJson -> "application/json"

execute :: (Aeson.FromJSON a) => Auth -> Request ac ct a -> IO a
execute auth req = do
    r <- asJSON =<< makeRequest auth req
    return (r ^. responseBody)

makeRequest :: Auth -> Request ac ct a -> IO (Response BS.ByteString)
makeRequest auth req =
    case req of
        Get paths qs ->
            let opts = setOpt auth . setOpt qs $ defaults
             in getWith opts $ url paths
  where
    url :: Path -> String
    url paths =
        T.unpack $ "https://api.vultr.com/v1/" <> T.intercalate "/" paths
