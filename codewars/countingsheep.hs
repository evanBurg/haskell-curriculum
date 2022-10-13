module Codewars.Kata.Sheep where

-- myFilter :: Bool a => a -> a
-- myFilter el = el == True

sheep = [True,  True,  True,  False,
  True,  True,  True,  True ,
  True,  False, True,  False,
  True,  False, False, True ,
  True,  True,  True,  True ,
  False, False, True,  True]
  
countSheep :: [Bool] -> Int
countSheep sheepArr = length (filter (\x -> x == True) sheepArr)