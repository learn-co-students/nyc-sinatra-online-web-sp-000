class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'landmarks/index'
  end

  post '/landmarks' do
    @new_landmark = Landmark.create(params[:landmark])
    @new_landmark.save
    redirect "/landmarks/#{@new_landmark.id}"
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    @landmark.save  
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

end
