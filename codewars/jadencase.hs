module JadenCasing where
import Data.Char

toJadenCase :: String -> String
toJadenCase = unwords . map (\(x:xs) -> toUpper x : xs) . words