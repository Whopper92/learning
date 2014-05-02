Feature: a player wins the game

  A player makes a move into a position that
  causes the board to contain three of their
  mark in a row, vertically, horizontally or
  diagonally.

  Scenario Outline:
    Given the current state of the board is <state>
    When I make a move into the position <position> as player <player>
    Then the board should be updated to <newState>
    And the game should alert <message>

  Scenarios: X wins diagonally
    | state     | position | player | newState  | message |
    | X---X---- | c3       | X      | X---X---X | X Wins! |
    | --X-X---- | a3       | X      | --X-X-X-- | X Wins! |

  Scenarios: X wins vertically
    | state     | position | player    | newState  | message |
    | X--X----- | a3       | X         | X--X--X-- | X Wins! |
    | -X--X---- | b3       | X         | -X--X--X- | X Wins! |
    | --X--X--- | c3       | X         | --X--X--X | X Wins! |

  Scenarios: X wins horizontally
    | state     | position | player    | newState  | message |
    | XX------- | c1       | X         | XXX------ | X Wins! |
    | ---XX---- | c2       | X         | ---XXX--- | X Wins! |
    | ------XX- | c3       | X         | ------XXX | X Wins! |

  Scenarios: O wins diagonally
    | state     | position | player    | newState  | message |
    | O---O---- | c3       | O         | O---O---O | O Wins! |
    | --O-O---- | a3       | O         | --O-O-O-- | O Wins! |

  Scenarios: O wins vertically
    | state     | position | player    | newState  | message |
    | O--O----- | a3       | O         | O--O--O-- | O Wins! |
    | -O--O---- | b3       | O         | -O--O--O- | O Wins! |
    | --O--O--- | c3       | O         | --O--O--O | O Wins! |

  Scenarios: O wins horizontally
    | state     | position | player    | newState  | message |
    | OO------- | c1       | O         | OOO------ | O Wins! |
    | ---OO---- | c2       | O         | ---OOO--- | O Wins! |
    | ------OO- | c3       | O         | ------OOO | O Wins! |
