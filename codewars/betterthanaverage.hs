module HowGoodAreYou where

betterThanAverage :: [Int] -> Int -> Bool
betterThanAverage grades myGrade = averageGrade < myGrade
    where averageGrade = sum grades `div` length grades