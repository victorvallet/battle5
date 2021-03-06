require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  # get '/' do
  # 'Testing infrastructure working!'
  # end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @score = params[:value]
    erb :play
  end

  # post '/score' do
  #   @player_1_name = session[:player_1_name]
  #   @player_2_name = session[:player_2_name]
  #   @score = params[:value]
  #   p @score
  #  erb :score
  #
  # end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
