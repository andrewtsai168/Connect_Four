class Turn
  attr_accessor :board, :player, :computer, :turn_number
  
  def initialize(board, player)
    @board = board
    @player = player
    @computer = computer
    @turn_number = 0
  end

  def place_selection
    p "Choose a column A-G to drop your piece!"
    selection = gets.chomp.upcase
    @turn_number += 1

    until @board.grid.first.include?(selection)
      p "Please input a column letter A-G."
      selection = gets.chomp.upcase
    end

    column_check
    add_piece_to_board
  end


  def column_converter
    if selection == "A"
      index_column = 0
    elsif selection == "B"
      index_column = 1
    elsif selection == "C"
      index_column = 2
    elsif selection == "D"
      index_column = 3
    elsif selection == "E"
      index_column = 4
    elsif selection == "F"
      index_column = 5
    elsif selection == "G"
      index_column = 6
    end
  end 
  

  def column_check(column_converter)
    index_row = 6
    column_contians = []
    6.times do 
      column_contains << grid[index_row][column_converter]
      index_row -= 1
    end
    
    if column_contains.include?(".")
      add_piece_to_board
    else
      p "This column is full. Please select another."
      place_selection
    end
  end
  
  
  def add_piece_to_board 
    # place the piece in the bottom of the selected column 
    if selection == @board.grid[0][0]
      place_column_a
    end
    # display_board
  end


  def place_column_a 
    index_row = 6
    until grid[index_row][column_converter]] == "."
      index_row -= 1
    end
    grid[index][column_converter]] = @player.piece
  end


  def display_board
    # this prints the new board after piece is placed
  end


end

# grid[0][0] => "A" 
# grid[6][0] => "X" => don't place the piece here 
# grid[5][0] => "." => place piece here