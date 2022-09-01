require 'rspec'
require './lib/board'
require './lib/player'
require './lib/computer'

RSpec.describe Computer do
  before (:each) do
    @board = Board.new
    @player = Player.new('Andrew')
    @computer = Computer.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@computer).to be_instance_of(Computer)
    end


    it 'has a piece O' do
      expect(@computer.piece).to eq('O')
    end
  end
end
