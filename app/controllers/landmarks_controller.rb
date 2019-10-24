class LandmarksController < ApplicationController

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get "/landmarks/new" do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/new'
  end
  
  post "/landmarks/new" do
    @new_landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{@new_landmark.id}"
  end
  
  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end
  
  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end
  
  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "/landmarks/#{params[:id]}"
  end

end
