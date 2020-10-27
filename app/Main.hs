{-# LANGUAGE OverloadedStrings #-}

module Main where

import Options.Applicative
import Data.Semigroup ((<>))

import qualified Vultr as V

auth :: V.Auth
auth = V.Auth "<API KEY>"

makeConfig :: V.Config
makeConfig = V.Config { V.authentication = auth, V.timeout = 30 }

cmd :: Parser String
cmd = argument str (metavar "resource")

main :: IO ()
main = do
    cmd <- execParser $ info cmd fullDesc
    case cmd of
        "servers" -> do
            V.execute makeConfig V.serverList
            return ()
