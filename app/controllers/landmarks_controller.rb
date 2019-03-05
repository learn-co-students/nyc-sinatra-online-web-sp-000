class LandmarksController < ApplicationController
  # add controller methods

  # View landing page for landmarks, allows you to view all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  # View New landmark page so you can create a landmark
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  # Display single landmark by ID
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # View form to edit landmark by ID
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']["year_completed"]
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

  # Redirect and collect new landmark info
  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end
end
