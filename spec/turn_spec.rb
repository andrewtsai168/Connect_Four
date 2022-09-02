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
      expect(@turn.board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]
        ])
    end

    it 'has a player' do
      expect(@turn.player).to eq(@player)
    end

    it 'has default turn number' do
      expect(@turn.turn_number).to eq(0)
    end
  end

  describe '#column_converter' do
    it 'will change the letter to a value associated with index' do
      expect(@turn.column_converter("A")).to eq(0)
    end
  end

  describe '#column_check' do 
    xit 'checks if the column is full' do 
      expect(@turn.column_check(0)).to eq
    end
  end
  
  describe '#add_piece_to_board' do 
   xit 'will drop the piece to the bottom of the column selected' do 
      expect(@turn.add_piece_to_board!).to eq(
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
      expect(@turn.place_selection).to eq("A")
      expect(@turn.add_piece_to_board!).to eq(
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

  describe '#display_board' do 
    xit 'will drop the piece to the bottom of the column selected' do 
      formatted_board = @turn.board.grid_format
      expect(formatted_board).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......")
      # expect(@turn.place_selection).to eq("A")
      @turn.add_piece_to_board!
      expect(formatted_board).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\nX......")
    end
  end
end
