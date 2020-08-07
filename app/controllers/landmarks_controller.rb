class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:figure])
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end
end
