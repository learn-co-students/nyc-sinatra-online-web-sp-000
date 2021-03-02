class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @figure = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

end
