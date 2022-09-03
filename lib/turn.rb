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
      p "Please try again"
      selection = gets.chomp.upcase
    end
    puts "Good job!"

  end

end
