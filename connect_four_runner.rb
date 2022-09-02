require 'rspec'
require './lib/board'
require './lib/player'
require './lib/turn'

board = Board.new
player = Player.new("Andrew")
turn = Turn.new(board, player)

turn.place_selection