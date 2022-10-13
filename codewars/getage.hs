module Haskell.Codewars.ParseNiceInt where

getAge :: (Integral a, Read a) => String -> a
getAge x = read [(head x)] :: Integer