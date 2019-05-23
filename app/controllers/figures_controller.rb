class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all

  erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do

  
  end
end
