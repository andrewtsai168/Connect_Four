class Print
  attr_reader :board

  def initialize(board)
    @board = board
  end



  def welcome
    puts "xxxxxxxxxxOOOOxxxxxxxxxx"
    puts "                        "
    puts "        CONNECT 4       "
    puts "                        "
    puts "xxxxxxxxxx0000xxxxxxxxxx"
  end

  def print_grid
    puts "        1 | 2 | 3 | 4 | 5 | 6 | 7"
    line
    print_row(0)
    line
    print_row(1)
    line
    print_row(2)
    line
    print_row(3)
    line
    print_row(4)
    line
    print_row(5)
  end

  def line
    puts "   -------------------------------"
  end

  def print_row(row)
end
