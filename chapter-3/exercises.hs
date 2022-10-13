module Exercises where
-- scope
-- 1: yes
-- 2: no
-- 3: no
-- 4: yes
myString = "Curry is awesome!"
main :: IO()
main = do
    -- syntax
    print ((++) [1, 2, 3] [4, 5, 6])
    print ("<3" ++ " Haskell")
    print (concat ["<3", " Haskell"])

    -- chapter syntax
    print (concat [[1, 2, 3], [4, 5, 6]])
    print ((++) [1, 2, 3] [4, 5, 6])
    print ((++) "hello" " world")
    print (["hello" ++ " world"])
    print ("hello" !! 4)
    print ((!!) "hello" 4)
    print (take 4 "lovely")
    print (take 3 "awesome")

    -- chapter match
    -- a) -> d)
    -- b) -> c)
    -- c) -> e)
    -- d) -> a)
    -- e) -> b)

    -- functions
    print (take 16 myString)
    print (myString !! 4)
    print (drop 9 myString)

dropLastChar :: String -> String
dropLastChar x = take listLength x
    where listLength = length x - 1 

getFifthChar :: String -> Char
getFifthChar x = x !! 4

dropFirstNine :: String -> String
dropFirstNine x = drop 9 x

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = str !! x
    where str = "Curry is awesome!"

rvrs :: String
rvrs = myAwesome ++ " " ++ myIs ++ " " ++ myCurry
    where myAwesome = take 7 (drop 9 myString)
          myIs      = [(myString !! 6)] ++ [(myString !! 7)]
          myCurry   = take 5 myString