class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.figure = Figure.find_or_create_by(params[:figure])
    @landmark.save
    redirect to("/landmarks/#{@landmark.id}")
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (params[:id])


end
