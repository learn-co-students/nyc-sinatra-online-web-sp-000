class LandmarksController < ApplicationController

    
  # Index action
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end
  
  # Create action
  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    landmark.figure = Figure.create(name: params[:figure][:name]) unless params[:figure][:name].empty?
    landmark.save
  end

  # Show action
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  # Edit action
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    # binding.pry    
    landmark.update(params['landmark'])
    # binding.pry
    landmark.figure = Figure.create(name: params['figure']['name']) unless params['figure']['name'].empty?
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end


 
end
