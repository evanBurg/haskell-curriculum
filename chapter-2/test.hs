sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

triple :: Int -> Int
triple x = x * 3

half x = x / 2
square x = x * x

piBySquare :: Double -> Double
piBySquare x = pi * (x * x)