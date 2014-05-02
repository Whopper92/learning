#! /usr/bin/env ruby

$LOAD_PATH.push File.join(File.dirname(__FILE__), '/../lib')
require 'tictactoe'

game = Tictactoe::Game.new(STDOUT)
game.start
myTurn = game.chooseHumanTurn(gets.chomp)

while !game.victory?('X') and !game.victory?('Y')
  while myTurn == true
    validMove = false
    while validMove == false
      puts "\n\nenter a position"
      pos = gets.chomp
      valid = game.makeMove(pos, 'X')
      validMove = true if valid == 0
    end
    myTurn = false
  end
  game.botMove('O')
  myTurn = true
end

