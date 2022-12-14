require 'rspec'
require './spec/spec_helper'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/turn'


RSpec.describe Turn do
  before (:each) do
    @board = Board.new
    @player = Player.new('Andrew')
    @computer = Computer.new
    @turn = Turn.new(@board, @player, @computer)
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

    it 'has a computer' do
      expect(@turn.computer).to eq(@computer)
    end

    it 'has default turn number' do
      expect(@turn.turn_number).to eq(0)
    end

    it 'has a default index column' do
      expect(@turn.index_column).to eq(0)
    end
  end

  describe '#random_column' do
    it 'will choose random column' do
      expect([0, 1, 2, 3, 4, 5, 6]).to include(@turn.random_column)
    end
  end

  describe '#column_converter' do
    it 'will change the letter to a value associated with index' do
      expect(@turn.column_converter("A")).to eq(0)
    end
  end

  describe '#column_avail?' do
    it 'returns true if column is available' do
      expect(@turn.column_converter("A")).to eq(0)
      expect(@turn.board.grid).to eq(
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
      expect(@turn.column_avail?(0)).to eq(true)
    end
  end

  describe '#add_piece_to_board' do
    it 'will drop the piece to the bottom of the column selected' do
      expect(@turn.board.grid).to eq(
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
      expect(@turn.column_converter("A")).to eq(0)
      expect(@turn.add_piece_to_board!(0)).to eq(
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
    it 'will drop the piece to the bottom of the column selected' do
      formatted_board = @turn.board.grid_format
      expect(formatted_board).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......")

      @turn.add_piece_to_board!(0)
      formatted_board = @turn.board.grid_format
      expect(formatted_board).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\nX......")
    end
  end
end
