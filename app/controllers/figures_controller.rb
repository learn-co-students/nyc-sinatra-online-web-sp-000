require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    landmark = Landmark.create(params[:landmark])
    title = Title.create(params[:title])
    @figure.landmarks << landmark
    @figure.titles << title
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    puts params
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    title = Title.new(params[:title])
    landmark = Landmark.new(params[:landmark])
    @figure.titles << title
    @figure.landmarks << landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
