class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/show'
  end 

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/edit'
  end 

  post '/landmarks/new' do 
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end 

  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end 
end
