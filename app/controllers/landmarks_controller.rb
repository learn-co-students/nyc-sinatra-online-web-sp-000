class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmark/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do

    @landmark = Landmark.create(params["landmark"])

    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.find_or_create_by(params["figure"])
    end

    @landmark.save

    redirect to "/songs/#{@landmark.id}"

  end


  get '/landmarks/:id' do

    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/show'
  end


  get '/landmarks/:id/edit' do

    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/edit'
  end


end
