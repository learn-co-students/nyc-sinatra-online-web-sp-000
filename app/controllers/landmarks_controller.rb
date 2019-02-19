class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  put '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.name = params[:landmark][:name]
    landmark.year_completed = params[:landmark][:year_completed]
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
end
