class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks' do

  end

  get '/landmarks/:id/edit' do

  end

  patch '/landmarks/:id/edit' do

  end
end
