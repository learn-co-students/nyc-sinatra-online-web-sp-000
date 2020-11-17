class LandmarksController < ApplicationController
  
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
   
    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

end
