class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks'
  Landmarks.all 
  erb :'/landmarks/index'
  end
  
  
  get '/landmarks/new' do
    #binding.pry
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to "landmark/#{@landmark.id}"
    
  end
  
  
  
  
end
