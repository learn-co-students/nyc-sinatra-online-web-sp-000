class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks/new' do
    @figures = Figure.all 
    
    erb :'landmarks/new'
  end
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    if !params[:title][:name].empty?
      @landmark.title = Title.find_or_create_by(name: params[:title][:name])
      @landmark.save
    end
    
    erb :'landmarks/index'
  end
  
  get '/landmarks' do 
    @landmarks = Landmark.all 
    
    erb :'landmarks/index'
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(id: params[:id])
    @figures = Figure.all
    
    erb :'landmarks/edit'
  end
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    if !params[:title][:name].empty?
      @landmark.title = Title.create(name: params[:title][:name])
    end
    @landmark.save 
    
    redirect "/landmarks/#{@landmark.id}"
  end
  
  
  
end
