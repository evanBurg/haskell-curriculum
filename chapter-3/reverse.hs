module Reverse where

rvrs :: String -> String
rvrs x = myAwesome ++ " " ++ myIs ++ " " ++ myCurry
    where myAwesome = take 7 (drop 9 x)
          myIs      = [(x !! 6)] ++ [(x !! 7)]
          myCurry   = take 5 x

main :: IO()
main = print $ rvrs "Curry is awesome!"