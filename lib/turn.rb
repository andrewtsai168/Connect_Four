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

    until @board.grid.first.include?(selection)
      p "Please input a column letter A-G."
      selection = gets.chomp.upcase
    end
    column_converter(selection)
  end


  def column_converter(selection)
    # selection_letters = @board.grid[0]
    
    # selection_letters.each_with_index do |l, index|
    #   index_column = index if selection == l
    # end
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
  

  def column_avail?(index_column)
    index_row = 6
    while @board.grid[index_row][index_column] == "." || index_row >= 1
      index_row -= 1
      if @board.grid[index_row][index_column] == "." 
        return true
      elsif index_row < 1 
        return false
      end
    end
  end
  
  def add_piece_to_board!(index_column)
    @turn_number += 1
    index_row = 6
    while @board.grid[index_row][index_column] != "."
      index_row -= 1
    end
    @board.grid[index_row][index_column] = @player.piece
    @board.grid
  end

  def display_board
    print @board.grid_format
  end
end