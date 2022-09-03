require 'rspec'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  before (:each) do
    @board = Board.new
    @player = Player.new('Andrew')
    @computer = Computer.new
    @turn = Turn.new(@board, @player, @computer)
    @game = Game.new(@turn, @board, @player, @computer)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game).to be_instance_of(Game)
    end
  end


end
