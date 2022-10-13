module StringRepeat where

repeatStr :: Int -> String -> String
repeatStr n str = concat [str | x <- [1..n]]
