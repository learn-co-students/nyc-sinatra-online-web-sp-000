class LandmarksController < ApplicationController

  ### CREATE ###
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    erb :'/landmarks/show'
  end

  ###  READ ###
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  ### UPDATE ###
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit' 
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    erb :"/landmarks/show"
  end


end
