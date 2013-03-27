path = File.expand_path "../", __FILE__
require 'sinatra'
require "#{path}/basics.rb"




get '/dev-whopper/learn_sinatra/main' do
  "First Message! WOOOO"
end

get '/dev-whopper/learn_sinatra/main/:name' do
  "Hello, #{params[:name].capitalize}!"
end

get '/dev-whopper/learn_sinatra/form' do
  erb :form
end

post '/dev-whopper/learn_sinatra/form' do
  "You said #{params[:message]}!"
end

get '/dev-whopper/learn_sinatra/secret' do
  erb :secret
end

post '/dev-whopper/learn_sinatra/secret' do
  "#{params[:password].reverse}"
end

get '/dev-whopper/learn_sinatra/decrypter/:secret' do
  "#{params[:secret].reverse}"
end

not_found do
  halt 404, "Derp! Not found!"
end
