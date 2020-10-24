module Vultr.Data.Account
(
) where

data Account = Account
  { balance :: String
  , pending_charges :: String
  , last_payment_date :: String
  , last_payment_amount :: String
  }
