class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark][:name])
    if !params[:landmark][:year_completed].empty?
      landmark.year_completed = params[:landmark][:year_completed]
      landmark.save
    end
    redirect to "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to "/landmarks/#{landmark.id}"
  end
end
