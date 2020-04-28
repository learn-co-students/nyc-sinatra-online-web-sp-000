class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{new_landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end


  patch '/landmarks/:id' do
    edited_landmark = Landmark.find(params[:id])
    edited_landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{edited_landmark.id}"
  end

end
