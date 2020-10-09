require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])  #this one
    @figure.titles << Title.find_or_create_by(:name => params[:name]) #this one
    @figure.landmarks << Landmark.find_or_create_by(:name => params[:name])
  end

 




  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])  #this one
    # unless params[:title][:name].empty?  #this one
    #   @figure.titles << Title.create(params[:title]) #this one
    # end
    # unless params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end
    @figure.titles << Title.find_or_create_by(:title => params[:title])
    @figure.landmarks << Landmark.find_or_create_by(:landmark => params[:landmark])
    @figure.save
    erb :'/figures/show'
  end
end
