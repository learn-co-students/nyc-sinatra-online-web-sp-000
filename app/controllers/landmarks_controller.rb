class LandmarksController < ApplicationController
  # add controller methods
  # allows you to view form to create a new landmark (FAILED - 1)
  get "/landmarks/new" do
    erb :"/landmarks/new"
  end

  # allows you to create a new landmark (FAILED - 2)
  post "/landmarks/new" do
    @landmark = Landmark.create(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end
  
  
  # allows you to view the form to edit a single landmark (FAILED - 5)
  # get "/landmarks/:id/edit" do
  #   @landmark = Landmark.find_by_id(params[:id])
  #   erb :"landmarks/edit"
  # end
  
  # allows you to edit a single landmark (FAILED - 6)
  # post "/landmarks/:id/edit" do
  #   @landmark = Landmark.find_by_id(params[:id])
  # end
  
  # allows you to see a single landmark (FAILED - 4)
  # get "landmarks/:id" do
  #   @landmark = Landmark.find_by_id(params[:id])
  #   erb :"/landmarks/show"
  # end
  # # allows you to list all landmarks (FAILED - 3)
  get "/landmarks" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/index"
  end
end
