module Kata where

countPositivesSumNegatives :: Maybe [Int] -> [Int]
countPositivesSumNegatives Nothing = []
countPositivesSumNegatives (Just []) = []
countPositivesSumNegatives (Just xs) = [positiveCount, negativeSum]
    where positiveCount = length $ filter (\x -> x > 0) xs
          negativeSum = sum $ filter (\x -> x < 0) xs