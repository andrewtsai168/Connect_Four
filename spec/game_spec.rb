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

  describe '#check_for_winner' do 
    it 'will check for a horizontal winner' do 
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(3)

      expect(@game.board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        ["X", "X", "X", "X", "O", "O", "O"]
        ])
      expect(@game.check_for_winner).to eq(@player)
    end

    xit 'will check for vertical winner' do
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(0)

      expect(@game.board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        ["X", ".", ".", ".", ".", ".", "."],
        ["X", ".", ".", ".", ".", ".", "."],
        ["X", ".", ".", ".", ".", ".", "."],
        ["X", ".", ".", ".", "O", "O", "O"]
        ])
      expect(@game.check_for_winner).to eq(@player)
    end

    xit 'will check for diagonal winner' do
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(3)

      expect(@game.board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", "X", ".", ".", "."],
        [".", ".", "X", "O", ".", ".", "."],
        [".", "X", "O", "X", "X", ".", "."],
        ["X", "O", "O", "X", "O", "O", "."]
        ])
      expect(@game.check_for_winner).to eq(@player)
    end

    it 'is a draw when board full' do 
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(6)

      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(0)

      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(6)

      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(0)

      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(6)

      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(3)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(0)

    
      expect(@game.board).to eq([
      ["A", "B", "C", "D", "E", "F", "G"],
      ["O", "X", "O", "X", "O", "X", "O"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["O", "X", "O", "X", "O", "X", "O"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["X", "O", "X", "O", "X", "O", "X"]
      ])
      expect(@game.turn.turn_number).to eq(42)
      expect(@game.check_for_winner).to eq("DRAW")
    end   
  end
end
