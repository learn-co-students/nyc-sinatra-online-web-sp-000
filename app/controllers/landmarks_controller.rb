class LandmarksController < ApplicationController
  get "/landmarks/new" do
    erb :'landmarks/new'
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post "/landmarks" do
    @landmark = Landmark.new(params[:landmark])
    if params[:figure][:name].size > 0
      @landmark.figure = Figure.create(params[:figure])
    end
    @landmark.save
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id]).update(params[:landmark])
    if params[:figure][:name].size > 0
      @landmark.figure = Figure.create(params[:figure])
    end
    @landmark.save
  end

  get "/landmarks" do
    erb :'landmarks/index'
  end
end
