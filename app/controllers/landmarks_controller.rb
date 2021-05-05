class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks= Landmark.all 
    erb :'/landmarks/index'
  end 
  
  get '/landmarks/new' do 
    erb :'/Landmark/new' 
  end 
  
  post '/Landmark' do 
    
     @landmark= Landmark.create(name: params[:Landmark][:name], year_completed: params[:Landmark][:year_completed] )
     @Landmark.save 
     redirect_to "Landmarks/#{Landmark.id}"
     
  end 
  
  get '/Landmarks/:id/edit' do
    @Landmark= Landmark.find(params[:id])
    erb "/Landmarks/edit "
  end 
  
  
  
end
