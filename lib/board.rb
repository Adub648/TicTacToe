class Board
  attr_accessor :cell

  # create initial tic-tac-toe board
  def initialize
    @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # display the board to the user
  def display_board
    puts " #{@cell[0]} | #{@cell[1]} | #{@cell[2]}"
    puts ' ---+---+---'
    puts " #{@cell[3]} | #{@cell[4]} | #{@cell[5]}"
    puts ' ---+---+---'
    puts " #{@cell[6]} | #{@cell[7]} | #{@cell[8]}"
  end

  # change the board from user input
  def enter_input(player_symbol, new_pos)
    @cell[new_pos] = player_symbol.to_s
  end

  def board_full?
    old_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    num_full = 0
    old_board.each_with_index do |pos, index|
      num_full += 1 if @cell[index] != pos
    end
    num_full == old_board.length
  end

  def validate_symbol(char, second_symbol, player_1_symbol)
    # prevent user entering more than one character or nothing at all
    if char.length > 1
      puts 'Error: Cannot have character more than one character in length! Please try again.'
      game = Game.new
      game.start_game
    elsif char.length.zero?
      puts "Error: Cannot have character that doesn't exist! Please try again."
      game = Game.new
      game.start_game
    elsif @cell.include?(char.to_i)
      puts 'Error: Cannot have number as character! Please try again.'
      game = Game.new
      game.start_game
    elsif second_symbol == true && char == player_1_symbol
      puts 'Error: Cannot have character the same as other player! Please try again.'
      game = Game.new
      game.start_game
    end
  end

  # check that the number is in the required range and a spot isn't already taken
  def validate_number?(num)
    @cell[num - 1] == num
  end
end
