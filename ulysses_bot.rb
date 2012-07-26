require 'sinatra'
require './litbot'

get '/hi' do
  "Hello World!"
end

get '/hi-kyle' do
  "Hello Kyle"
end

get '/ulysses-bot' do
  ulysses_bot = LitBot.new
  ulysses_bot.eat_file("ulysses.txt")
  ulysses_bot.digest_file
  "Ulysses says, \"#{ulysses_bot.speak}\""
end
