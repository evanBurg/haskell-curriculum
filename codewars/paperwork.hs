module Codewars.Kata.Paperwork where

paperwork :: Int -> Int -> Int
paperwork n m = if n < 0 || m < 0 then 0 else pages
    where pages = n * m