{-# LANGUAGE OverloadedStrings #-}
module Main where

import Vultr

-- auth :: Auth
-- auth = VultrAuth "<API KEY>"

main :: IO ()
main = do
  servers <- execute auth $ serverList
