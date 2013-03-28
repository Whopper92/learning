path = File.expand_path '../', __FILE__

require 'sinatra'
require "#{path}/zuulboardMain.rb"

run Sinatra::Application
