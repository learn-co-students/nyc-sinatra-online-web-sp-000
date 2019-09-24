require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @title = Title.create(params[:title])
      @title.figure_ids << @figure.id
      @title.save
      @figure.titles << @title
    end

    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure_id = @figure.id
      @landmark.save
      @figure.landmarks << @landmark
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title].empty?
      @title = Title.create(params[:title])
      @title.figure_ids << @figure.id
      @title.save
      @figure.titles << @title
    end

    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure_id = @figure.id
      @landmark.save
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
