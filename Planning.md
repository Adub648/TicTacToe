# File structure
Multiple files, each of them containing their own classes which will then all get sent to main.rb which does all the work

Files
- main.rb for running the game
- game.rb for game logic and player info (can't have player info in seperate file as makes game.rb unreadable)
- board.rb for board info

# Ideas
Have arrays of the winning positions
Record the position that a user enters their value in an array
Check this array against the winnable arrays
Use something to make the variable used for player 1/ player 2 change often