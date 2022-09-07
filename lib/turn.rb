class Turn
  attr_accessor :board, :player, :computer, :turn_number, :index_column

  def initialize(board, player, computer)
    @board = board
    @player = player
    @computer = computer
    @turn_number = 0
    @index_column = 0
  end

  def player_turn
    while true
      place_selection
      if column_avail?(index_column) == true
        add_piece_to_board!(index_column)
        display_board
        break
      end
    end
  end

  def computer_turn
    while true
      random_column
      if column_avail?(index_column) == true
        add_piece_to_board!(index_column)
        display_board
        break
      end
    end
  end

  def place_selection
    print "\n" + "Choose a column A-G to drop your piece!"
    selection = gets.chomp.upcase

    until @board.grid.first.include?(selection)
      p "Please input a column letter A-G."
      selection = gets.chomp.upcase
    end
    column_converter(selection)
  end

  def random_column
    selection = @board.grid[0].sample
    column_converter(selection)
  end

  def column_converter(selection)
    if selection == "A"
      @index_column = 0
    elsif selection == "B"
      @index_column = 1
    elsif selection == "C"
      @index_column = 2
    elsif selection == "D"
      @index_column = 3
    elsif selection == "E"
      @index_column = 4
    elsif selection == "F"
      @index_column = 5
    elsif selection == "G"
      @index_column = 6
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
    if @turn_number.odd? == true
      @board.grid[index_row][index_column] = @player.piece
    else
      @board.grid[index_row][index_column] = @computer.piece
    end
    @board.grid
  end

  def display_board
    print @board.grid_format + "\n\n\n"
  end
end
