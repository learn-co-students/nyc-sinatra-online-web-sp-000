class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/new' do

    erb :'figures/new'
  end


end
