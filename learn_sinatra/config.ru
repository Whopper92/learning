path = File.expand_path "../", __FILE__

require 'sinatra'
require "#{path}/basics.rb"

run Sinatra::Application
