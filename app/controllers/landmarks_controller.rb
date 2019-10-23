class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get "/landmarks/new" do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

end
