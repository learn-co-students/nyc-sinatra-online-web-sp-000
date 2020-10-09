class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    #create new landmark
    landmark = Landmark.create(params[:landmark])
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    binding.pry
    landmark = Landmark.find_by(id: params[:id])
    landmark.update(params[:landmark])
    landmark.save

    redirect "/landmarks/#{params[:id]}"
  end



end
