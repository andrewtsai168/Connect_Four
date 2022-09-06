class Game
  attr_accessor :turn, :board, :player, :computer

  def initialize(turn, board, player, computer)
    @turn = turn
    @board = board
    @player = player
    @computer = computer
  end

  def start
    puts welcome
    if main_menu != "P"
      return false
    end
    puts @board.grid_format
    turn = Turn.new(@board, @player, @computer)
    while true
      print "#{@player.name}'s Turn"
      turn.player_turn
      if end_game != nil
        break
      end
      print "Computer's Turn \n"
      turn.computer_turn
      if end_game != nil
        break
      end
    end
  end

  def end_game
    if check_for_winner != nil
      if check_for_winner == "DRAW"
        puts "~*~*~*GAME IS A DRAW~*~*~*"
        clear_board
      elsif check_for_winner == @computer
        puts "The winner is ~*~*~Computer~*~*~"
        clear_board
      else
        puts "The winner is ~*~*~#{@player.name}~*~*~"
        clear_board
      end
    end
  end

  def clear_board
    @board.grid = @board.empty_board
    start
  end
  
  def welcome
     "Welcome to Connect 4!"
  end

  def main_menu
    puts "Enter p to play. Enter q to quit."
    play_choice = gets.chomp.upcase
    play_choice
  end

  def check_for_winner
    if horizontal_winner != nil
      return horizontal_winner
    end
    if vertical_winner != nil
      return vertical_winner
    end
    if diagonal_winner != nil
      return diagonal_winner
    end
    if draw != nil
      return draw
    end
  end

  def horizontal_winner
    hori_arrs = @board.grid.map do |rows|
      rows.join
    end

    rows = hori_arrs.find do |row|
      row.include?("OOOO") || row.include?("XXXX")
    end

    if rows != nil
      if rows.include?("XXXX")
        @player
      elsif rows.include?("OOOO")
        @computer
      end
    end
  end

  def vertical_winner
    transposed_board = @board.grid.transpose
    vert_arrs = transposed_board.map do |columns|
      columns.join
    end

    columns = vert_arrs.find do |column|
      column.include?("XXXX") || column.include?("OOOO")
    end

    if columns != nil
      if columns.include?("XXXX")
        @player
      elsif columns.include?("OOOO")
        @computer
      end
    end
  end

  def diagonal_winner
    diagonals = {
      diag_1: [@board.grid[1][0], @board.grid[2][1], @board.grid[3][2], @board.grid[4][3], @board.grid[5][4], @board.grid[6][5]],
      diag_2: [@board.grid[1][1], @board.grid[2][2], @board.grid[3][3], @board.grid[4][4],@board.grid[5][5], @board.grid[6][6]],
      diag_3: [@board.grid[1][2], @board.grid[2][3], @board.grid[3][4], @board.grid[4][5], @board.grid[5][6]],
      diag_4: [@board.grid[1][3], @board.grid[2][4], @board.grid[3][5], @board.grid[4][6]],
      diag_5: [@board.grid[2][0], @board.grid[3][1], @board.grid[4][2], @board.grid[5][3], @board.grid[6][4]],
      diag_6: [@board.grid[3][0], @board.grid[4][1], @board.grid[5][2], @board.grid[6][3]],
      diag_7: [@board.grid[6][0], @board.grid[5][1], @board.grid[4][2], @board.grid[3][3], @board.grid[2][4], @board.grid[1][5]],
      diag_8: [@board.grid[6][1], @board.grid[5][2], @board.grid[4][3], @board.grid[3][4], @board.grid[2][5], @board.grid[1][6]],
      diag_9: [@board.grid[6][2], @board.grid[5][3], @board.grid[4][4], @board.grid[3][5], @board.grid[2][6]],
      diag_10: [@board.grid[6][3], @board.grid[5][4], @board.grid[4][5], @board.grid[3][6]],
      diag_11: [@board.grid[5][0], @board.grid[4][1], @board.grid[3][2], @board.grid[2][3], @board.grid[1][4]],
      diag_12: [@board.grid[4][0], @board.grid[3][1], @board.grid[2][2], @board.grid[1][3]]
    }

    diag_arr = diagonals.map do |diag, element|
      element.join
    end

    diag_string = diag_arr.find do |diagonal|
      diagonal.include?("XXXX") || diagonal.include?("OOOO")
    end

    if diag_string != nil
      if diag_string.include?("XXXX")
        @player
      elsif diag_string.include?("OOOO")
        @computer
      end
    end
  end

  def draw
    if @turn.turn_number >= 42
      "DRAW"
    end
  end
end
