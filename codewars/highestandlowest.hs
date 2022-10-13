module Kata (highAndLow) where
import Data.Char

highAndLow :: String -> String
highAndLow input = highest ++ " " ++ lowest
    where integerList = map (\x -> read x :: Integer) $ words input
          highest = show $ maximum integerList
          lowest = show $ minimum integerList