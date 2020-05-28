require 'pry'
class FiguresController < ApplicationController

  # add controller methods
 

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"/figures/new"
    
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params:id)
    erb :"/figures/show"
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params[:figure])
    
    # @figure.landmark_ids= params[:figure][:landmark_ids]
    # @figure.title_ids = params[:figure][:title_ids]
    # if !params[:title][:name].empty?
    #   Title.create(params[:title][:name])
    # end
    # @figure.save
    redirect '/figures/#{@figure.id}'
  end

  
end
