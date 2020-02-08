class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do 
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/edit'
  end
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed] 
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
end
