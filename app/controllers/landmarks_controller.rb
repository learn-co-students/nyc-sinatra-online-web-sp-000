require 'pry'

class LandmarksController < ApplicationController

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end 

  post '/landmarks' do
    @name = params[:landmark][:name]
    @year = params[:landmark][:year_completed]
    @landmarks = Landmark.create(name: @name, year_completed: @year)
    redirect to "/landmarks/#{@landmarks.id}"
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end 

  patch '/landmarks/:id' do 
  end 


end
