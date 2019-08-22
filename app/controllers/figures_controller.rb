class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title = Title.find_or_create_by(:name => params[:title][:name])
    @figure.landmark = Landmark.find_or_create_by(:name => params[:landmark][:name])
    @figure.save
    redirect '/figures/#{@figure.id}'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end
end
