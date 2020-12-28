class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id].to_i)
    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)

    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end
end
