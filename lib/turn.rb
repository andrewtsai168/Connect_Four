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
    change_board
  end

  def add_piece_to_board 
    # place the piece in the bottom of the selected column 
    if selection == @board.grid[0][0]
      
    end
    display_board
  end

  def display_board
    # this prints the new board after piece is placed
  end


end

grid[0][0] => "A"
grid[6][0] => "X" => # don't place the piece here 
grid[5][0] => "." => # place piece here