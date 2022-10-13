module Codewars.G964.Accumule where
import Data.Char (toUpper, toLower)
import Data.List (intercalate)

{--
    This time no story, no theory. The examples below show you how to write function accum:

    Examples:
    accum("abcd") -> "A-Bb-Ccc-Dddd"
    accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
    accum("cwAt") -> "C-Ww-Aaa-Tttt"
    The parameter of accum is a string which includes only letters from a..z and A..Z.
-}


fixCapital :: String -> String
fixCapital (x:xs) = [toUpper x] ++ (map toLower xs)

accum :: [Char] -> [Char]
accum = intercalate "-" . map fixCapital . zipWith replicate [1..]