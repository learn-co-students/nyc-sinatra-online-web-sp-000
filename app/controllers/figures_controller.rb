class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.save
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
end
