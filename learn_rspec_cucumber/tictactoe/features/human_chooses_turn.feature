Feature: human chooses turn
  As a human
  I will either choose to go first or second

  Scenario Outline: choose turn
    Given I started the game and the computer asks if I want to go first
    When I choose to go <choice>
    Then the game should respond <message>

  Scenarios: I choose to go first
    | choice | message           |
    |  f     | You go first!     |

  Scenarios: I choose to go second
    | choice | message           |
    |  s     | I'll go first!    |
