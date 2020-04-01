class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do 
    
    erb :'/landmarks/new'
  end 

  post '/landmarks/' do 
    if !params["landmark"]["name"].empty? && !params["landmark"]["landmark_year_completed"]
      @landmark.name = Landmark.create(name: params["landmark"]["name"])
    end 

    if !params["landmark"]["landmark_year_completed"]
      @landmark.year_completed = Landmark.create(name: params["landmark"]["year_completed"])
    end 

    @figure.save 

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
