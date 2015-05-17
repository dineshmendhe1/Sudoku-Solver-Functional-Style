{-
Sudoku Solver using "Elegant Brute" approach.
Author :- Dinesh Mendhe
-}

{-
Rules Specification:

1. Test grid is list of lists of digit characters, with '0' meaning blank
2. A row is list of values of any type.
3. A matrix is a list of rows of any type.
4. A digit is a single character.
5. A valid grid is one for which
    each row contains no duplicates,
    each column contains no duplicates,
    each box (3x3) contains no duplicates.

-}

-- EXACT TIME TOOK TO SOLVE TESTPUZZLE USING THIS BRUTE FORCE APPROCH IS 35 SECONDS WITH ALL OPERATIONS

type Row a = [a]

type Matrix a = [ Row a ]

type Digit = Char 

type Grid = Matrix Digit 

type Choices = [ Digit ]


{- 
Detail implementation of operations in "Choices"
-}

digits :: [Digit]
digits = ['1'..'9']
--digits = "123456789"


blank :: Digit -> Bool 
blank = (== '0')
-- blank row = elem True (map (== '0') row)


choices :: Grid -> Matrix Choices 
choices = map ( map choices') where 
                    choices' c = if blank c then digits else [c]



{-
Detail implementation of operations in "Expand"
-}

cp :: [[a]] -> [[a]]
cp [] = [[]]
cp (xs:xss) = [ x1:y1 | x1<- xs, y1 <- cp xss]


expand :: Matrix Choices -> [Grid]
expand choices = cp $ map cp choices
--expand choices =  cp (map cp choices)

{-
Detail implementation of operations in "valid"
-}

group :: [a] -> [[a]]
group [] = []
group xs = take 3 xs : group(drop 3 xs)

ungroup :: [[a]] -> [a]
ungroup = concat


rows :: Matrix a -> [Row a]
-- rows = (\x -> x)
rows = id



cols :: Matrix a -> [Row a]
cols ([]:_) = []
cols x = (map head x) : cols (map tail x)


boxs :: Matrix a -> [Row a]
boxs = ungroup . map cols . group


nodups :: Eq a=> [a] -> Bool
nodups [] = True
nodups (x:xs)
	| elem x xs = False
	| otherwise = nodups xs


valid:: Grid -> Bool
valid x = test nodups (rows x) && test nodups(cols x) && test nodups (boxs x)	
		where test y  = and . map y
        
{-
Implementation of solve function using three functions above.
-}

solve :: Grid -> [Grid]
solve p = filter valid  (expand (choices p))

{-
solve :: Grid -> [Grid]
solve p = extract valid  (expand (choices p))
			where extract f xs = [x | x <- xs, f x]
-}

testPuzzle = [
    "603719458",
    "708624931",
    "491803276",
    "569178342",
    "837542169",
    "140936587",
    "314287095",
    "975361804",
    "286490713"
    ]




