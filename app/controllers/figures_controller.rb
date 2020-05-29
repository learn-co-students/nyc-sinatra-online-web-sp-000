require 'pry'
class FiguresController < ApplicationController

  # add controller methods
 

  get '/figures' do

    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
    
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  post '/figures' do
    
    @figure = Figure.create(params[:figure])
    @title = params[:title]
    @landmark = params[:landmark]
    if !@title[:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    if !@landmark[:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    binding.pry
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @title = params[:title]
    @landmark = params[:landmark]
    if !@title[:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end

    if !@landmark[:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
      ninding.pry
    end

    @figure.save
    
    redirect to "/figures/#{@figure.id}"
  end
end
