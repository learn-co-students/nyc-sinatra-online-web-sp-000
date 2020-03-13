class LandmarksController < ApplicationController

  get '/landmarks' do

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    
    erb :'landmarks/new'
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    @landmark.figure = Figure.create
    
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figure][:name] == @figure.name
      @landmark.figure = Figure.create(params[:figure])
    end
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end
end
