class LandmarksController < ApplicationController
  get '/landmarks/new' do 
    erb :'landmarks/new'
    #view form to create new landmark
  end
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    unless params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    @landmark.save
    redirect to "/landmarks/#{landmark.id}"
    #post- create new landkarm
  end
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
    #list all landmarks (index)
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/edit'    
  end

  patch '/landmarks/:id' do 
  @landmark = Landmark.find(params[:id])
  @landmark.name = params[:landmark][:name]
  @landmark.year_completed = params[:landmark][:year_completed]
  @landmark.save  
  redirect("/landmarks/#{@landmark.id}")
end
  
end
