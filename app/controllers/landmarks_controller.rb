class LandmarksController < ApplicationController
  # add controller methods
  get "/" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get "/new" do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/new'

  end

end
