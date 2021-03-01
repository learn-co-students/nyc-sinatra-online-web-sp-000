class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    landmark.save
    @landmarks = Landmark.all
    @landmarks << landmark
    erb :'landmarks/index'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @updated_landmark = Landmark.find_by(params[:id])
    @updated_landmark.update(params[:name], params[:year_completed])
    @updated_landmark.save
    redirect("/landmarks/#{@updated_landmark.id}")
  end

end
