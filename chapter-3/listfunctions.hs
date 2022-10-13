-- cons "builds a list"
'c' : "hris" -- "chris"
'P' : "" -- "P"

-- head "returns the first element of a list"
head "Papuchon" -- "P"

-- tail "returns the list without the first element"
tail "Papucon" -- "apucon"

-- take "returns the specified amount of elements from the start of the list"
take 1 "Papuchon" -- "P"
take 0 "Papuchon" -- ""
take 6 "Papuchon" -- "Papuch"

-- drop "returns the remainder of the list after the specified number of elements have been dropped"
drop 4 "Papuchon" -- "chon"
drop 9001 "Papuchon" -- ""
drop 6 "Papuchon" -- "on"

-- !! operator "returns the specified element in a list"
"Papuchon" !! 0 -- 'P'
"Papuchon" !! 4 -- 'c'

-- THESE FUNCTIONS DO NOT HANDLE EMPTY LISTS