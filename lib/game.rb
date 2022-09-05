class Game
  attr_accessor :turn, :board, :player, :computer
  
  def initialize(turn, board, player, computer)
    @turn = turn
    @board = board
    @player = player
    @computer = computer
  end

  def welcome
     "Welcome to Connect 4!"
  end

  def main_menu
    puts "Enter p to play. Enter q to quit."
    play_choice = gets.chomp.upcase
    if play_choice == "P"
      @turn.display_board
      @turn.place_selection
    end
  end

  def check_for_winner
    horizontal_winner
    vertical_winner
    diagonal_winner
    draw
  end

  def horizontal_winner
    hori_arrs = @board.grid.map do |rows|
      rows.join
    end
    
    rows = hori_arrs.find do |row|
      row.include?("XXXX" || "OOOO")
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
      column.include?("XXXX" || "OOOO")
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
      diagonal.include?("XXXX" || "OOOO")
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
