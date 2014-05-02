Feature: player makes a move

  The player submits the position of the square
  on the game board where they would like to
  place an X.

  If the spot is free, an X is placed on the spot.
  If there are three X's in a row vertically,
  horizontally or diagonally, the human wins the
  game.

  Scenario Outline: make move
    Given the state of the board is <state>
    When I choose the spot <position>
    Then the board should be updated to <newState>

  Scenarios: an empty position
    | state     | position | newState  |
    | --------- | a1       | X-------- |

  Scenarios: a full position
    | state     | position | newState  |
    | O-------- | a1       | O-------- |

