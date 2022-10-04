# Sudoku Solution Validator
# https://www.codewars.com/kata/529bf0e9bdf7657179000008

# Write a function that accepts a 2D array representing a Sudoku board,
# and returns true if it is a valid solution, or false otherwise

def validSolution(board)
  board.each do |row|
    return false if row.sort != [1,2,3,4,5,6,7,8,9]
  end

  board.transpose.each do |row|
    return false if row.sort != [1,2,3,4,5,6,7,8,9]
  end
  return false if (board[0].slice(0..2)+board[1].slice(0..2)+board[2].slice(0..2)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[3].slice(0..2)+board[4].slice(0..2)+board[5].slice(0..2)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[6].slice(0..2)+board[7].slice(0..2)+board[8].slice(0..2)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[0].slice(3..5)+board[1].slice(3..5)+board[2].slice(3..5)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[3].slice(3..5)+board[4].slice(3..5)+board[5].slice(3..5)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[6].slice(3..5)+board[7].slice(3..5)+board[8].slice(3..5)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[0].slice(6..8)+board[1].slice(6..8)+board[2].slice(6..8)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[3].slice(6..8)+board[4].slice(6..8)+board[5].slice(6..8)).sort != [1,2,3,4,5,6,7,8,9]
  return false if (board[6].slice(6..8)+board[7].slice(6..8)+board[8].slice(6..8)).sort != [1,2,3,4,5,6,7,8,9]

  return true
end
