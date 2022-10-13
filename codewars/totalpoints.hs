module TotalPoints where

readOr :: Read a => String -> r -> (a -> r) -> r
readOr raw def withParsedValue = case reads raw of 
    [(x,"")] -> withParsedValue x
    _ -> def

scoreToPoints :: [Char] -> Int
scoreToPoints score = do
    let (homeTeam,awayTeam) = break (==':') score
    let x = readOr homeTeam (error $ "invalid input: " ++ homeTeam) id
    let y = readOr (drop 1 awayTeam) (error $ "invalid input: " ++ awayTeam) id :: Integer
    if x > y then 3
    else if x == y then 1
    else 0

points :: [String] -> Int
points scores = sum $ map scoreToPoints scores

-- module TotalPoints where
-- import Data.List.Split

-- points :: [String] -> Int
-- points x = (sum . map (score . map read . splitOn ":")) x

-- score :: [Int] -> Int
-- score [x,y] | x > y = 3
--             | x < y = 0
--             | x == y = 1