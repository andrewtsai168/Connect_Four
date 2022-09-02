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

  describe '#add_piece_to_board' do 
    it 'will drop the piece to the bottom of the column selected' do 
      expect(turn.add_piece_to_board).to eq(
        [
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]
        ]
      )
      expect(turn.place_selection).to eq("A")
      expect(turn.add_piece_to_board).to eq(
        [
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        ["X", ".", ".", ".", ".", ".", "."]
        ]
      )
    end
  end
end
