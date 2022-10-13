{-
    Convert number to reversed array of digits
    Given a random non-negative number, you have
    to return the digits of this number within an array
    in reverse order.
-}

module Codewars.Kata.Convert where

digitize :: Int -> [Int]
digitize s = [read [x] | x <- (reverse (show s))]