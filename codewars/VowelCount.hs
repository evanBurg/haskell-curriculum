module Codewars.Kata.Vowel where

vowels = ['a', 'e', 'i', 'o', 'u']
getCount :: String -> Int
getCount = foldl (\acc el -> if el `elem` vowls then acc + 1 else acc) 0