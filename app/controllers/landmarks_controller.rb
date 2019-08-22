class LandmarksController < ApplicationController
  # add controller methods
  
  
  get '/landmarks/new' do
    @landmarks= Landmark.all
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    
  end
  
  
  
  
end
