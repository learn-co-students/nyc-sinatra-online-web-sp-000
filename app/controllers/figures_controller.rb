class FiguresController < ApplicationController
#view form to create a new figure

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @figure_landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    #binding.pry
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    #@figure.titles << @title
    @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
  end

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by(id: params[:id].to_i)
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    redirect "/figures/#{@figure.id}"
  end
end
