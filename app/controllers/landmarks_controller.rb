class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do

  	erb :'landmarks/new'
  end

  post '/landmarks' do
		@lan = Landmark.create(params[:landmark])
		redirect "/landmarks/#{@lan.id}"
  end

  get '/landmarks/:id/edit' do
  	@land = Landmark.find(params[:id])

  	erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
  	@land = Landmark.find(params[:id])
  	@land.update(params[:landmark])
  	@land.save
  	erb :'figures/show'
  end

  get '/landmarks' do
  	@lans = Landmark.all
  	erb :'landmarks/index'
  end

  get '/landmarks/:id' do
  	@lan = Landmark.find(params[:id])
  	erb :'landmarks/show'
  end
end
