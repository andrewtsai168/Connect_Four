require 'rspec'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/turn'
require './lib/game'


board = Board.new
player = Player.new("Andrew")
computer = Computer.new
turn = Turn.new(board, player, computer)
game = Game.new(turn, board, player, computer)

# turn.place_selection
puts game.welcome
game.main_menu
