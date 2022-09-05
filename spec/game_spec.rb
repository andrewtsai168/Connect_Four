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
      expect(@game.horizontal_winner).to eq(@player)
    end

    it 'will check for vertical winner' do
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
      expect(@game.vertical_winner).to eq(@player)
    end

    it 'will check for diagonal winner' do
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
      expect(@game.diagonal_winner).to eq(@player)
    end

    it 'is a draw when board full' do 
      # row 1
      @turn.add_piece_to_board!(0) #X
      @turn.add_piece_to_board!(1) #O
      @turn.add_piece_to_board!(2) #X
      @turn.add_piece_to_board!(3) #o
      @turn.add_piece_to_board!(4) #x
      @turn.add_piece_to_board!(5) #o
      @turn.add_piece_to_board!(6) #x
      # row 2
      @turn.add_piece_to_board!(5) #o
      @turn.add_piece_to_board!(6) #x
      @turn.add_piece_to_board!(3) #o
      @turn.add_piece_to_board!(2) #x
      @turn.add_piece_to_board!(1) #o
      @turn.add_piece_to_board!(4) #x
      @turn.add_piece_to_board!(6) #o
      # row 3
      @turn.add_piece_to_board!(0) #x
      @turn.add_piece_to_board!(0) #o
      @turn.add_piece_to_board!(5) #x
      @turn.add_piece_to_board!(4) #o
      @turn.add_piece_to_board!(3) #x
      @turn.add_piece_to_board!(2) #o
      @turn.add_piece_to_board!(1) #x
      # row 4
      @turn.add_piece_to_board!(1) #o
      @turn.add_piece_to_board!(0) #x
      @turn.add_piece_to_board!(3) #o
      @turn.add_piece_to_board!(2) #x
      @turn.add_piece_to_board!(5) #o
      @turn.add_piece_to_board!(4) #x
      @turn.add_piece_to_board!(5) #o
      # row 5 
      @turn.add_piece_to_board!(6) #x
      @turn.add_piece_to_board!(3) #o
      @turn.add_piece_to_board!(4) #x
      @turn.add_piece_to_board!(1) #o
      @turn.add_piece_to_board!(2) #x
      @turn.add_piece_to_board!(4) #o
      @turn.add_piece_to_board!(0) #x

      @turn.add_piece_to_board!(0) #o
      @turn.add_piece_to_board!(6) #x
      @turn.add_piece_to_board!(2) #o
      @turn.add_piece_to_board!(1) #x
      @turn.add_piece_to_board!(3) #o
      @turn.add_piece_to_board!(5) #x
      @turn.add_piece_to_board!(6) #o

    
      expect(@game.board.grid).to eq([
      ["A", "B", "C", "D", "E", "F", "G"],
      ["O", "X", "O", "O", "O", "X", "O"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["O", "X", "O", "X", "O", "X", "O"],
      ["X", "O", "X", "O", "X", "O", "X"],
      ["X", "O", "X", "O", "X", "O", "X"]
      ])
      expect(@game.turn.turn_number).to eq(42)
      expect(@game.draw).to eq("DRAW")
    end 

    it 'can have computer win' do 
      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(0)
      @turn.add_piece_to_board!(6)
      @turn.add_piece_to_board!(1)
      @turn.add_piece_to_board!(5)
      @turn.add_piece_to_board!(2)
      @turn.add_piece_to_board!(4)
      @turn.add_piece_to_board!(3)
      
      expect(@game.board.grid).to eq([
        ["A", "B", "C", "D", "E", "F", "G"],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "X"],
        ["O", "O", "O", "O", "X", "X", "X"]
        ])
        require 'pry'; binding.pry
      expect(@game.check_for_winner).to eq(@computer)
    end
  end
end
