class LandmarksController < ApplicationController
  # create routes ###############################
  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  post '/landmarks' do    
    landmark = Landmark.create(name: params[:landmark_name], year_completed: params[:landmark_year_completed])    
    redirect "/landmarks/#{landmark.id}"
  end

  # read routes #################################
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/:id' do    
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  # update routes ###############################
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])    
    landmark.update(name: params[:name], year_completed: params[:year_completed])
    redirect "/landmarks/#{landmark.id}"
  end


  # delete routes ###############################
end
