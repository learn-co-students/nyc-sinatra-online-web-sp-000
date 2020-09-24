class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    #binding.pry
    @landmark = Landmark.create(params["landmark"])
    redirect "/landmarks"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
