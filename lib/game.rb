class Game
  attr_accessor :turn, :board, :player, :computer
  def initialize(turn, board, player, computer)
    @turn = turn
    @board = board
    @player = player
    @computer = computer
  end

end
