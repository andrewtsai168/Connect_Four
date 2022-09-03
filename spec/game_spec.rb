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

    it 'has a turn' do
      expect(@game.turn).to eq(@turn)
    end

    it 'has a board' do
      expect(@game.board).to eq(@board)
    end

    it 'has a player' do
      expect(@game.player).to eq(@player)
    end

    it 'has a computer' do
      expect(@game.computer).to eq(@computer)
    end
  end

  describe '#welcome' do
    it 'has a welcome message' do
      expect(@game.welcome). to eq("Welcome to Connect 4!")
    end


  end


end
