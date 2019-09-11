class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name])
      if params[:landmark][:year_completed] != ""
        @landmark.year_completed = params[:landmark][:year_completed].to_i
        @landmark.save
      end
    end

    redirect to ("/landmarks/#{@landmark.id}")
  end  

  patch '/landmarks' do
    @landmark = Landmark.find(params[:landmark_id].to_i)
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed].to_i
    @landmark.save
    redirect to ("/landmarks/#{@landmark.id}")
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id].to_i)
    erb :'/landmarks/edit'
  end
end
