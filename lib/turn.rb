class Turn
  attr_accessor :board, :player, :turn_number
  def initialize(board, player)
    @board = board
    @player = player
    # @computer = computer
    @turn_number = 0

  end


end
