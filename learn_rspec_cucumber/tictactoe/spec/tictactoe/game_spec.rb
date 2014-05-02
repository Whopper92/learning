require File.join(File.dirname(__FILE__), '/../spec_helper')

module Tictactoe
  describe Game do

    before(:each) do
      @messenger = double('messenger').as_null_object
      @game = Game.new(@messenger)
    end

    context 'starting the game' do
      it 'should send a general welcome message' do
        @messenger.should_receive(:puts).with('Welcome to Tictactoe!')
        @game.start
      end

      it 'should ask the player if they want to go first' do
        @messenger.should_receive(:puts).with('Would you like to go first?')
        @game.start
      end

      it 'should initialize the game board' do
        @game.board.should == ['-','-','-','-','-','-','-','-','-']
        @game.start
      end
    end

    context 'choosing a turn' do
      it 'should say "You go first!" when the human chooses to go first' do
        @messenger.should_receive(:puts).with('You go first!')
        @game.start
        @game.chooseHumanTurn('f')
      end

      it 'should say "I\'ll go first!" when the human chooses not go go first' do
        @messenger.should_receive(:puts).with('I\'ll go first!')
        @game.start
        @game.chooseHumanTurn('s')
      end
    end

    context 'making a move' do
      context 'when the desired position is empty' do
        it 'should update the state of the board' do
          @game.makeMove('a1', 'X')
          @game.board.should == ['X','-','-','-','-','-','-','-','-']
        end
      end
      context 'when the desired position is full' do
        it 'should not update the state of the board' do
          @game.instance_variable_set :@board, ['O','-','-','-','-','-','-','-','-']
          @messenger.should_receive(:puts).with('Invalid move')
          @game.makeMove('a1', 'X')
          @game.board.should == ['O','-','-','-','-','-','-','-','-']
        end
      end
      context 'when the computer is moving' do
        it 'should choose a random, unused board position' do
          @game.instance_variable_set :@board, ['O','-','-','-','-','-','-','-','-']
          @game.botMove('X')
          @game.board.should_not == ['O','-','-','-','-','-','-','-','-']
        end
      end
    end
    context 'winning the game' do
      it 'should declare X the winner if X places a third diagonal position' do
          @game.instance_variable_set :@board, ['X','-','-','-','X','-','-','-','-']
          @messenger.should_receive(:puts).with('X Wins!')
          @game.makeMove('c3', 'X')
          @game.board.should == ['X','-','-','-','X','-','-','-','X']
      end
      it 'should declare X the winner if X places a third vertical position' do
          @game.instance_variable_set :@board, ['X','-','-','X','-','-','-','-','-']
          @messenger.should_receive(:puts).with('X Wins!')
          @game.makeMove('a3', 'X')
          @game.board.should == ['X','-','-','X','-','-','X','-','-']
      end
      it 'should declare X the winner if X places a third horizonal position' do
          @game.instance_variable_set :@board, ['X','X','-','-','-','-','-','-','-']
          @messenger.should_receive(:puts).with('X Wins!')
          @game.makeMove('c1', 'X')
          @game.board.should == ['X','X','X','-','-','-','-','-','-']
      end

    end
  end
end
