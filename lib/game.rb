# game logic
class Game
  # define constants
  WINNABLE_POSITIONS = [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [2, 5, 8]

  def initialize
    # define intial values
    @board = Board.new
    @pos = nil
    @won_game = false
    @player_1 = ''
    @player_1_symbol = ''
    @player_1_array = []
    @player_1_turn = false
    @player_2 = ''
    @player_2_symbol = ''
    @player_2_array = []
  end

  def start_game
    # get input from user to start game, validate and place in instance variables
    puts 'What is the first players name?'
    @player_1 = gets.chomp
    validate_name(@player_1)
    puts 'What is the first players symbol?'
    @player_1_symbol = gets.chomp
    @board.validate_symbol(@player_1_symbol, false, @player_1_symbol)
    puts 'What is the second players name?'
    @player_2 = gets.chomp
    validate_name(@player_2)
    puts 'What is the second players symbol?'
    @player_2_symbol = gets.chomp
    @board.validate_symbol(@player_2_symbol, true, @player_1_symbol)
    play_game
  end

  def play_game
    # start the game, checking if it is won
    @player_1_turn = true
    play_turn while @won_game == false
  end

  def play_turn
    # get input from user to place symbol
    puts "It's #{@player_1_turn ? @player_1 : @player_2}'s turn!"
    puts "Please enter the position in which you would like a #{@player_1_turn ? @player_1_symbol : @player_2_symbol} entered."
    # validate and enter input on board
    @pos = gets.chomp.to_i
    if @board.validate_number?(@pos) == false
      puts 'Error: Invalid input! Please try again.'
      return
    end
    @pos -= 1
    @board.enter_input(@player_1_turn ? @player_1_symbol : @player_2_symbol, @pos)
    @board.display_board
    process_turn
    swap_players
  end

  def swap_players
    # swap who's turn it is
    @player_1_turn = if @player_1_turn
                       false
                     else
                       true
                     end
  end

  def process_turn
    # determine if game is won
    @player_1_turn ? @player_1_array.push(@pos) : @player_2_array.push(@pos)
    WINNABLE_POSITIONS.each do |array|
      @won_game = true if (array - (@player_1_turn ? @player_1_array : @player_2_array)).empty?
    end
    if @won_game
      won_game(@player_1_turn ? @player_1 : @player_2)
    end
  end

  def won_game(winner)
    # output winner message and prompt to play again
    puts "Congratulations, #{winner} has won the game!"
    play_again
  end

  def validate_name(name)
    # prevent name being empty
    if name.length.zero?
      puts "Error: Cannot have name that doesn't exist! Please try again."
      start_game
    end
  end
end
