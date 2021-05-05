class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks= Landmark.all 
    erb :'/landmarks/index'
  end 
  
  get '/landmarks/new' do 
    erb :'/Landmark/new' 
  end 
  
  post '/landmark' do 
    
     @landmark= Landmark.create(name: params[:Landmark][:name], year_completed: params[:Landmark][:year_completed] )
     @Landmark.save 
     redirect_to "Landmarks/#{Landmark.id}"
     
  end 
  
  get '/landmarks/:id/edit' do
    @Landmark= Landmark.find_by(params[:id])
    erb "/Landmarks/edit "
  end 
  
   patch '/landmarks/:id' do 
     @landmark= Landmark.find(params[:id])
     @landmark.name = 	params[:landmark][:name]
     @landmark.year_completed = params[:landmark][:year_completed]
     @landmark.save 
     redirect_to 'landmarks/#{@landmark.id}'

   end 
  
end
