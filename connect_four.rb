# Connect four
# https://www.codewars.com/kata/56882731514ec3ec3d000009

# The first player who connects four items of the same color is the winner.
# You should return "Yellow", "Red" or "Draw" accordingly.

def who_is_winner(pieces_position_list)
  #board = Array.new(6, Array.new(7, 'X'))
  board = Array.new(7) {[]}
  pieces_position_list.each do |move|
    column = move.chr.bytes[0]-65
    board[column].push(move[2])
    if check_down(board, column, board[column].length-1 )
       return move[2] == "R" ?  "Red" : "Yellow" 
    end
    if check_left_right(board, column, board[column].length-1 )
       return move[2] == "R" ?  "Red" : "Yellow"
    end
    if check_rising_diagonal(board, column, board[column].length-1 )
       return move[2] == "R" ?  "Red" : "Yellow"
    end
     if check_falling_diagonal(board, column, board[column].length-1 )
       return move[2] == "R" ?  "Red" : "Yellow"
    end

  end
  return "Draw"
end

def check_down(board, x, y)
  if y-3>=0
    if board[x][y] == board[x][y-1] && board[x][y-1] == board[x][y-2] && board[x][y-2] == board[x][y-3]
      return true
     end
  end
end

def check_left_right(board, x, y)
  if x-3>=0
    if board[x-3][y] == board[x-2][y] && board[x-2][y] == board[x-1][y] && board[x-1][y] == board[x][y]
      return true
     end
  end
  if x-2>=0 && board[x+1]
    if board[x-2][y] == board[x-1][y] && board[x-1][y] == board[x][y] && board[x][y] == board[x+1][y]
      return true
     end
  end
  if x-1>=0 && board[x+2]
    if board[x-1][y] == board[x][y] && board[x][y] == board[x+1][y] && board[x+1][y] == board[x+2][y]
      return true
     end
  end
  if board[x+3]
    if board[x][y] == board[x+1][y] && board[x+1][y] == board[x+2][y] && board[x+2][y] == board[x+3][y]
      return true
    end
   end
  return false
end

def check_rising_diagonal(board, x, y)
 if x-3>=0 && y-3>=0
    if board[x-3][y-3] == board[x-2][y-2] && board[x-2][y-2] == board[x-1][y-1] && board[x-1][y-1] == board[x][y]
      return true
     end
  end
  if x-2>=0 && y-2>=0 && board[x+1] && board[x+1][y+1]
    if board[x-2][y-2] == board[x-1][y-1] && board[x-1][y-1] == board[x][y] && board[x][y] == board[x+1][y+1]
      return true
     end
  end
  if x-1>=0 && y-1>=0 && board[x+2] && board[x+2][y+2]
    if board[x-1][y-1] == board[x][y] && board[x][y] == board[x+1][y+1] && board[x+1][y+1] == board[x+2][y+2]
      return true
     end
  end
  if board[x+3] && board[x+3][y+3]
    if board[x][y] == board[x+1][y+1] && board[x+1][y+1] == board[x+2][y+2] && board[x+2][y+2] == board[x+3][y+3]
      return true
    end
   end
  return false
end

def check_falling_diagonal(board, x, y)
 if x-3>=0 && board[x-3][y+3]
    if board[x-3][y+3] == board[x-2][y+2] && board[x-2][y+2] == board[x-1][y+1] && board[x-1][y+1] == board[x][y]
      return true
     end
  end
  if x-2>=0 && board[x-2][y+2] && board[x+1] && y-1 >= 0
    if board[x-2][y+2] == board[x-1][y+1] && board[x-1][y+1] == board[x][y] && board[x][y] == board[x+1][y-1]
      return true
     end
  end
  if x-1>=0 && board[x-1][y+1] && board[x+2] && y-2 >= 0
    if board[x-1][y+1] == board[x][y] && board[x][y] == board[x+1][y-1] && board[x+1][y-1] == board[x+2][y-2]
      return true
     end
  end
  if board[x+3] && y-3 >= 0
    if board[x][y] == board[x+1][y-1] && board[x+1][y-1] == board[x+2][y-2] && board[x+2][y-2] == board[x+3][y-3]
      return true
    end
   end
  return false
end
