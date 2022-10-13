module FriendOrFoe where

friend :: [String] -> [String]
friend = filter (\x -> length x == 4)