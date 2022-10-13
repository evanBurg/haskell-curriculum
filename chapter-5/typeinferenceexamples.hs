-- 1. Type signature of general function:
-- (++) :: [a] -> [a] -> [a]
-- How might that change when we apply it to the following value?

myConcat x = x ++ " yo"
-- myConcat :: [Char] -> [Char]

myMult x = (x / 3) * 5
-- myMult :: Fractional a => a -> a

myTake x = take x "hey you"
-- myMult :: Int -> [Char]

myCom x = x > (length [1..10])
-- myCom :: Int -> Bool

myAlph x = x < 'z'
-- myAlph :: Char -> Bool