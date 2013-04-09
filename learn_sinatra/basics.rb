require 'sinatra'
require "./basics.rb"

get '/main' do
  "First Message! WOOOO"
end

get '/main/:name' do
  "Hello, #{params[:name].capitalize}!"
end

get '/form' do
  erb :form
end

post '/form' do
  "You said #{params[:message]}!"
end

get '/secret' do
  erb :secret
end

post '/secret' do
  "#{params[:password].reverse}"
end

get '/decrypter/:secret' do
  "#{params[:secret].reverse}"
end

not_found do
  halt 404, "Derp! Not found!"
end
