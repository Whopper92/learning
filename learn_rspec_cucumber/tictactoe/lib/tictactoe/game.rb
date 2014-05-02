#! /usr/bin/ruby

module Tictactoe
  class Game

    attr_reader :board

    def initialize(messenger)
      @messenger = messenger
      @board     = ['-','-','-','-','-','-','-','-','-']
      @posHash = Hash.new
    end

    def start
      @messenger.puts 'Welcome to Tictactoe!'
      @messenger.puts 'Would you like to go first?'
    end

    def chooseHumanTurn(decision)
      if decision == 'f'
        @messenger.puts 'You go first!'
        return true
      else
        @messenger.puts 'I\'ll go first!'
        return false
      end
    end

    def makeMove(position, marker)
      index = decodeMove(position)
      if @board[index] == '-'
        @board[index] = marker
        victory?(marker)
        return 0
      else
        @messenger.puts 'Invalid move'
        return 1
      end
    end

    def botMove(marker)
      moved = false
      while moved == false
        index = (0..8).to_a.sample
        if @board[index] == '-'
          @board[index] = marker
          moved = true
        end
      end
      @messenger.print(@board[6..8])
      puts ""
      @messenger.print(@board[3..5])
      puts ""
      @messenger.print(@board[0..2])
    end

    def victory?(marker)
      wins  = [[0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8], [0,1,2], [3,4,5], [6,7,8]]

      victory = false
      wins.each do |rows|
        if @board[rows[0]] == marker and @board[rows[1]] == marker and @board[rows[2]] == marker
          victory = true
        end
      end

      @messenger.puts "#{marker} Wins!" if victory == true
      return victory
    end

    def decodeMove(pos)
      case pos
        when 'a1'
          index = 0
        when 'a2'
          index = 3
        when 'a3'
          index = 6
        when 'b1'
          index = 1
        when 'b2'
          index = 4
        when 'b3'
          index = 7
        when 'c1'
          index = 2
        when 'c2'
          index = 5
        when 'c3'
          index = 8
      end
      return index
    end
  end
end
