class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
  @landmarks=Landmark.all 
  erb :'/landmarks/index'
  end
  
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    #binding.pry
    redirect "landmark/#{@landmark.id}"
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
    #binding.pry
  end
  
 patch '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    #binding.pry
    @landmark.update(params[:landmark])
    #@landmark.update(params[:landmark][:year_completed])
    @landmark.save
    redirect :"/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  
  
end
