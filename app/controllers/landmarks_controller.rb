class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  get '/landmarks/:id/edit' do
    @titles = Title.all
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end
  get '/landmarks/new' do
    @titles = Title.all
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end
  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(params[:landmark])
    redirect to "landmarks/#{@landmark.id}"
  end
  patch '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect to "landmarks/#{@landmark.id}"
  end
end
