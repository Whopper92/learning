def messenger
  @messenger ||= StringIO.new
end

def game
  @game ||= Tictactoe::Game.new(messenger)
end

def messages_should_include(message)
  messenger.string.split("\n").should include(message)
end

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game.start
end

Then(/^the game should say "(.*?)"$/) do |message|
  messages_should_include(message)
end

Then(/^the game should ask "(.*?)"$/) do |message|
  messages_should_include(message)
end

Then(/^the game should initialize the board$/) do
  game.board.should == ['-','-','-','-','-','-','-','-','-']
end

####

Given(/^I started the game and the computer asks if I want to go first$/) do
end

When(/^I choose to go (.*)$/) do |choice|
  game.chooseHumanTurn(choice)
end

Then(/^the game should respond (.*)$/) do |message|
  messages_should_include(message)
end

####

Given(/^the state of the board is (.*)$/) do |state|
  game.instance_variable_set :@board, state.split('')
end

When(/^I choose the spot (.*)$/) do |position|
  game.makeMove(position, 'X')
end

Then(/^the board should be updated to (.*)$/) do |state|
  game.board.should == state.split('')
end

###

Given(/^the current state of the board is (.*)$/) do |state|
  game.instance_variable_set :@board, state.split('')
end

When(/^I make a move into the position (.*) as player (.*)$/) do |position, player|
  game.makeMove(position, player)
end

Then(/^the game should alert (.*)$/) do |player|
  messages_should_include(player)
end
