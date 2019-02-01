class LandmarksController < ApplicationController
  
  #create new landmark form
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end
  
  #list all landmarks 
  get '/landmarks' do
    erb :'/landmarks/index'
  end 
  
  #create a new landmark
  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end
  
  #view a single landmark
   get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
  
  #show form for editing a single landmark
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end
  
  #edit landmark
  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
end
