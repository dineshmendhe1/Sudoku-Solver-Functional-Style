## Brute-force Sudoku Solver
## Author- Dinesh Mendhe

###1. List of the Data types for Sudoku Solver.
	** Inbuilt Data types which we may need or proposed representation
	 a. Data List
	 b. Data Array
	 c. Data Char
	 d. Data Int
	 
	** New Data types that we may need
	 a. Grid
	 b. Value
	 c. Board
	 d. Subgrid
	 e. Result
	 
###2. An specification and implementation of a solve function (In Brute-froce way)

	Steps:
	 a. For every position in the grid try all possible digits.
	 b. Start from the lst( top leftmost) grid to 9th(bottom rightmost) grid.
	 c. Validate each grid.
	 d. As haskell is lazy it may evaluate fast in Brute-force way.
	 
	 Solve Function: 
	 	sub Functions:
				* gridToArray: It will convert grid representation into a String.
				* isEmpty
				* isFull     : If all the fields are filled in the grid, then we have found the solution.
				* readValue
				* checkField or checkDuplicate : This function will check for all position in subgrids for duplicates, if there it will remove it.
				* rows
				* column
				* potentialSolution: It will explore all the potential solutions by filling this cell with a possible digit and continuing with the remaining position. 
									  List all the digits that can be good candidate for a position. 
									  Candidates are all the digits in [1..9] that are not in the row, the column and the square that contains the position.
