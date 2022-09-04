class Game
  attr_accessor :turn, :board, :player, :computer
  
  def initialize(turn, board, player, computer)
    @turn = turn
    @board = board
    @player = player
    @computer = computer
  end

  def welcome
     "Welcome to Connect 4!"
  end

  def main_menu
    puts "Enter p to play. Enter q to quit."
    play_choice = gets.chomp.upcase
    if play_choice == "P"
      @turn.display_board
      @turn.place_selection
    end
  end

  def check_for_winner
    horizontal_winner?
    vertical_winner?
    diagonal_winner?
  end

  def horizontal_winner?
    hori_arr = @board.grid.map do |row|
      require 'pry'; binding.pry
      row.join.include?("XXXX" || "OOOO")
    end
  end

  def vertical_winner?

  end

  def diagonal_winner?

  end
end
