# use other ruby files with this file
require_relative 'game'
require_relative 'board'

def initialize_game
  # create new instance variable for game and play
  game = Game.new
  game.start_game
end

def play_again
  # ask if user wants to play another game
  puts 'Would you like to play again? Type "Y" or "N".'
  answer = gets.chomp

  # if they want to play, trigger another game, otherwise exit
  if answer == 'Y'
    puts 'Yay, another game!'
    initialize_game
  else
    puts 'Thanks for playing!'
    exit
  end
end

initialize_game

# pseudocode
# function(play_game) to start game from game.rb
# function(play_again) for playing again
# play_game
