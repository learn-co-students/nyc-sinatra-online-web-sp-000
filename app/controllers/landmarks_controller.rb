class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end
 
  get '/landmarks/new' do
    @figures = Figure.all

    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "landmark/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: params[:landmark][:figure_id])

    redirect to "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id/delete' do
    @landmark = Landmark.find(params[:id]).destroy

    redirect to "/landmarks"

  end


end