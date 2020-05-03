class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    landmark_id
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    landmark_id
    erb :"landmarks/edit"
  end

  # edits landmark
  post '/landmarks/:id' do
    landmark_id
    @landmark.update!(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect to "/landmarks/#{@landmark.id}"
  end

  post '/landmarks' do
    Landmark.create!(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end

  helpers do
    def landmark_id
      @landmark = Landmark.find(params[:id])
    end
  end
end
