WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input_integer = input.to_i
  return board_position = input_integer - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    curr_player = current_player(board)
    move(board, index, curr_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |move| 
    if move == "X" || move == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O" 
end

def won?(board)

if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
  return false
end
  
WIN_COMBINATIONS.each do |win_combination|
  
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] 
  position_2 = board[win_index_2] 
  position_3 = board[win_index_3] 

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  end
  
  if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
end

return false
end

def full?(board)
  board.all? do |piece|
    piece == "X" || piece == "O"
  end  
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  position = won?(board)
  if position 
    return board[position[0]]
  end
  return nil
end

def play(board)
  
  puts turn_count(board)
  
  until over?(board) do
    turn(board)
  end
  
  
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end





