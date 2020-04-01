class LandmarksController < ApplicationController
  
  get '/landmarks' do 

    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do 
    @landmarks = Landmark.all
    
    erb :'/landmarks/new'
  end 

  post '/landmarks/' do 
    
    if !params["landmark"]["name"].empty?
      @landmark.name = Landmark.create(name: params["landmark"]["name"])
    end 

    if !params["landmark"]["landmark_year_completed"]
      @landmark.year_completed = Landmark.create(year_completed: params["landmark"]["landmark_year_completed"])
    end 
    @landmark.save 

    redirect to :"/landmarks/#{@landmark.id}"
  end 

  get '/landmarks/:id/edit' do 

    erb :'/landmarks/edit'
  end 

  get '/landmarks/:id' do 
    
    erb :'/landmarks/show'
  end 

  patch '/landmarks/:id' do 

  end 
  
end
