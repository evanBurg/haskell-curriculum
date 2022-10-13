module MakeUpper (makeUpperCase) where
import Data.Char

makeUpperCase :: String -> String
makeUpperCase = map toUpper