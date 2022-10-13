 -- Review of Types
 
 -- 1. What is the type of [[True, False], [True, True], [False, True]]?
 -- d) [[Bool]]
 
 -- 2. Which of the following has the same type as [[True, False], [True, True], [False, True]]?
 -- b) [[3 == 3], [6 > 5], [3 < 4]]
 
 -- 3. For the function below, which of the following statements are true?
 -- func :: [a] -> [a] -> [a]
 -- func x y = x ++ y
 -- d) All of the above
 
 -- 4. For the func code above, which is a valid application of func to both of its arguments?
 -- b) func "Hello" "World"


 -- Reviewing currying

-- cattyConny :: String -> String -> String
-- cattyConny x y = x ++ " mrow " ++ y

-- flippy = flip cattyConny

-- appedCatty = cattyConny "woops"
-- frappe = flippy "haha"

 -- 1. What is the value of appedCatty "woohoo!"? Try to determine the answer for yourself, then test it in the REPL.
 -- "woops mrow woohoo!" 
 
 -- 2. frappe "1"
 -- "1 mrow haha"

 -- 3. frappe (appedCatty "2")
 -- "woops mrow 2 mrow haha"

 -- 4. appedCatty (frappe "blue")
 -- "woops mrow blue mrow haha"
 
 -- 5. cattyConny (frappe "pink")
 --               (cattyConny "green"
 --               (appedCatty "blue"))
 -- "pink mrow haha mrow green woops mrow blue"

 -- 6. cattyConny (flippy "Pugs" "are") "awesome"
 -- "arow mrow Pugs mrow awesome"


 -- Recursion

 -- 1. Write out the steps for reducing dividedBy 15 2 to its final answer according to the Haskell code.
 -- dividedBy 15 2
 -- = go 15 2 0
 -- = go 13 2 1
 -- = go 11 2 2
 -- = go 9 2 3
 -- = go 7 2 4
 -- = go 5 2 5
 -- = go 3 2 6
 -- = go 1 2 7
 -- = (7, 1)

 -- 2. Write a function that recursively sums all numbers from 1 to n,
 -- n being the argument. So if n is 5, you’d add 1 + 2 + 3 + 4 + 5 to
 -- get 15. The type should be (Eq a, Num a) => a -> a.

recurseSum :: (Eq a, Num a) => a -> a
recurseSum num = go 0 0
    where go sum count
            | count == num = sum
            | otherwise = go (sum + (count + 1)) (count + 1)

recurseSum' 0 = 0
recurseSum' num = recurseSum' (num-1) + num 

-- recurseSum 0 = 0
-- recurseSum 1 = 1
-- recurseSum 2 = 1 + 2 = recurseSum 1 + 2 = 3
-- recurseSum 3 = 1 + 2 + 3 = recurseSum 2 + 3 = 6
-- recurseSum 4 = 1 + 2 + 3 + 4 = recurseSum 3 + 4 = 10

-- 3. Write a function that multiplies two integral numbers using
-- recursive summation. The type should be (Integral a) => a ->
-- a -> a

recurseMult :: (Integral a) => a -> a -> a
recurseMult numA numB = go numA numB 0
    where go a b sum
            | b == 0 = sum
            | otherwise = go a (b - 1) (sum + a) 

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

data DividedResult = Result Integer | DividedByZero deriving Show

dividedBy' :: Integral a => a -> a -> DividedResult
dividedBy' num denom = go num denom 0
    where go n d count
            | d == 0 = DividedByZero
            | d < 0 = go n (-d) count
            | n < 0 = go (-n) d count
            | n < d = Result count
            | otherwise = go (n - d) d (count + 1)

mc91 x
    | x > 100 = x - 10
    | otherwise = mc91 $ mc91 (x + 11)