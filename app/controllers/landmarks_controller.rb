class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmarks = Landmark.all
      @figures = Figure.all
      erb :'landmarks/index'
    end

    get '/landmarks/new' do
      erb :"landmarks/new"
    end

    post '/landmarks' do
      Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
      redirect '/landmarks'
    end
end
