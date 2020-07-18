class LandmarksController < ApplicationController

  #see all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  #create new landmark
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  #show a single landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  #edit a landmark
  get '/landmarks/:id/edit' do
  @landmark = Landmark.find(params[:id])
  erb :'/landmarks/edit'
end

patch '/landmarks/:id' do
  @landmark = Landmark.find(params[:id])
  @landmark.update(params[:landmark])
  redirect "/landmarks/#{@landmark.id}"
end

end
