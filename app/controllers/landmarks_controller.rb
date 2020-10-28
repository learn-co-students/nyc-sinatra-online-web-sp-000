class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'landmarks/new'
  end

  # if there is no association between figure and landmark then create on, if there one exist then find by id
  post '/landmarks' do
    @landmark = Landmarks.create(params[:landmark])
    if !params["figure"]["landmark"].empty?
      @landmark.figure = Landmark.create(name: params["figure"]["name"])
    else
      @landmark.figure = Figure.find_by_id(params[:landmark][:figure_id])
    end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figure = Figure.all
    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # allow the user to edit a landmark name, and which figure it associates with 
  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])

    if !params["figure"]["landmark"]
      @landmark.figure = Figure.create(name: params["figure"]["landmark"])
    else
      @landmark.figure = Figure.find_by_id(params[:landmark][:figure_id])
    end
    @landmark.save 

    redirect to "/landmarks/#{@landmark.id}"
  end
end
