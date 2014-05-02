Feature: human player starts game
  As the human player
  I want to start a game
  So I can beat the computer

Scenario: start game
  Given I am not yet playing
  When I start a new game
  Then the game should say "Welcome to Tictactoe!"
  And the game should ask "Would you like to go first?"
  And the game should initialize the board
