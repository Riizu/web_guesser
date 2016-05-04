require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => settings.number, :message => message}
end

def check_guess(guess)
  if guess.to_i > settings.number && guess.to_i - settings.number > 5
    message = "Way too high!"
  elsif guess.to_i < settings.number && settings.number - guess.to_i > 5
    message = "Way too low!"
  elsif guess.to_i > settings.number
    message = "Too high!"
  elsif guess.to_i < settings.number
    message = "Too low!"
  else
    message = "You got it right!"
  end
  message
end
