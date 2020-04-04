require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
    @figure.save
    redirect '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
    @figure.save
    redirect '/figures/<%@figure.id%>'
  end

end
