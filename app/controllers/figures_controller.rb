class FiguresController < ApplicationController

  ### create ###
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'figures/new'
  end


  post '/figures' do 
    @figure = Figure.create(name: params[:figure][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:name])
    @figure.titles << Title.find_or_create_by(name: params[:name])
    erb :'figures/show'
  end

  ### read ###
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  ### update ###

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
  @titles = Title.all
  @landmarks = Landmark.all
    redirect "/figures/#{@figure.id}"
  end


  ### delete ###


end
