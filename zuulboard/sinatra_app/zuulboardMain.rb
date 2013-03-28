path = File.expand_path '../', __FILE__
require 'sinatra'
require "#{path}/zuulboardMain.rb"

get '/dev-whopper/zuulboard/itempop' do
  erb :itempop
end

not_found do
  halt 404, "Unable to locate resource :("
end
