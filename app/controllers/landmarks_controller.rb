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
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/edit'
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/show'
  end 

  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params["landmark"])
    @landmark.save 

    redirect to :"/landmarks/#{@landmark.id}"
  end 
  
end
