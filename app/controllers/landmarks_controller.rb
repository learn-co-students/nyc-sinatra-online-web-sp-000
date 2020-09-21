class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :"landmarks/index" 
  end 
  
  get '/landmarks/new' do 
    @titles = Title.all
    @landmarks = Landmark.all 
    erb :"landmarks/new"
  end 

  post '/landmarks' do 
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    # erb :"landmarks/show"
  end 

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    puts "#{@landmark.name}!!!"
    erb :"landmarks/show"
  end 

  patch '/landmarks/:id' do 
    # puts params
    @landmark = Landmark.find(params[:id])
    # binding.pry
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end 

end
