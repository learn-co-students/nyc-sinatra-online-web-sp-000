class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    landmark = Landmark.create({name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"]})
    redirect to "/landmarks/#{landmark.id}"
  end

  patch '/landmarks/:id' do
    Landmark.find(params[:id]).update({name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"]})
    redirect to "/landmarks/#{params[:id]}"
  end
end
