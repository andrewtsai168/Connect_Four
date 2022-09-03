require 'rspec'
require './lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'is an instance of board' do
      board = Board.new
      expect(board).to be_instance_of Board
    end

    it 'has a grid' do
      board = Board.new
      expect(board.grid_format).to eq(
      "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......")
    end
  end

  # describe '#welcome' do
  #   it 'has a welcome message' do
  #     board = Board.new
  #     expect(board.welcome). to eq("Welcome to Connect 4!")
  #   end
  # end
end
