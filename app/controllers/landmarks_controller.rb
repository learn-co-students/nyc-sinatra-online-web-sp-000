require 'pry'
class LandmarksController < ApplicationController
  
  get '/landmarks/new' do 
    erb:'/landmarks/new'
  end 

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb:'landmarks/index'
  end 

  post '/landmarks' do 
    @landmark = Landmark.create(params["landmark"])
    redirect to "/landmarks/#{@landmark.id}"
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb:'/landmarks/show'
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id]) 
    erb:'/landmarks/edit'
  end 
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id]) 
      if params[:landmark][:name] != ""
        @landmark.name = params[:landmark][:name]
      end 

      if params[:landmark][:year_completed] != ""
        @landmark.year_completed = params[:landmark][:year_completed]
      end 
      @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end 


end

