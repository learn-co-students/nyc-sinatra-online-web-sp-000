class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title = params[:title]
    @figure.landmarks = params[:landmarks]
    @figure.save
    redirect to "/figures"
  end
end
