class LandmarksController < ApplicationController
  
  get '/landmarks' do
     @landmarks = Landmark.all
     erb :"landmarks/index"
  end


  get '/landmarks/new' do
     erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
 end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  post '/landmarks' do
     Landmark.create(params[:landmark])

     redirect "/landmarks" 
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}" 
  end


end
