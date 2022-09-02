class Board
  attr_accessor :grid
  def initialize
    @grid = empty_board
  end

  def empty_board
    [
      ["A", "B", "C", "D", "E", "F", "G"],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."]
    ]
  end

  def grid_format
    printed_board = @grid.map do |row|
      row.join
    end
    printed_board.join("\n")
  end

  def welcome
    "Welcome to Connect 4!"
  end
end
