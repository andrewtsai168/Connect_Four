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
    elsif play_choice == "Q"
      puts "Please Don't Leave..."
      puts "Enter p to play. Enter q to quit."
      play_choice = gets.chomp.upcase
    else
      puts "Enter p to play. Enter q to quit."
      play_choice = gets.chomp.upcase
    end
  end

end
