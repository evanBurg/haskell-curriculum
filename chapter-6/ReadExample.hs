module ReadExample where

readOr :: Read a => String -> r -> (a -> r) -> r
readOr raw def withParsedValue = 
    [(x,"")] -> withParsedValue x
    _ -> def