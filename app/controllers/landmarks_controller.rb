class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  post '/landmarks' do
    name = params[:landmark][:name]
    year_completed = params[:landmark][:year_completed]

    @landmark = Landmark.create(name: name)
    @landmark.year_completed = year_completed unless year_completed == ""
    @landmark.save
    redirect to "/landmarks"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    @titles = Title.all
    erb :"/landmarks/edit"
  end

  patch '/landmarks/:id' do
    name = params[:landmark][:name]
    year = params[:landmark][:year_completed]
    @landmark = Landmark.find(params[:id])
    @landmark.name = name unless name == nil
    @landmark.year_completed = year unless year == nil
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
