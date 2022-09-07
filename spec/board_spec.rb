require 'rspec'
require './lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'is an instance of board' do
      board = Board.new
      expect(board).to be_instance_of Board
    end

    it 'has an empty board' do
      board = Board.new
      expect(board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]
        ])
    end
  end

  it 'has a formatted board' do
    board = Board.new
    expect(board.grid_format).to eq(
    "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......")
  end
end
