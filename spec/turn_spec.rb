require 'rspec'
require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before (:each) do
    @board = Board.new
    @player = Player.new('Andrew')
    @turn = Turn.new(@board, @player)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
    end

    it 'has a board' do
      expect(@turn.board.grid_format).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......")
    end

    it 'has a player' do
      expect(@turn.player).to eq(@player)
    end

    it 'has default turn number' do
      expect(@turn.turn_number).to eq(0)
    end
  end

end
