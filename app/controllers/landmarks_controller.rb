class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do 
    @landmarks = Landmark.all 
    erb :"/landmarks/index"
  end
  
  get "/landmarks/new" do 
    @titles = Title.all 
    @figures = Figure.all 
    erb :"/landmarks/new"
  end 
  
  post "/landmarks" do 
    if params["landmark"]["name"] == ""
     redirect to "landmarks"
    end
    
    @landmark = Landmark.create(params["landmark"])
    @landmark.save 
    redirect to "landmarks/#{@landmark.id}"
  end
  
  get "/landmarks/:id" do 
  
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end
  
  get "/landmarks/:id/edit" do 
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all 
    @titles = Title.all 
    erb :"landmarks/edit"
  end
  
  patch "/landmarks/:id" do 
    if !params[:landmark].keys.include?("figure_id")
        params[:landmark]["figure_id"] = []
    end
    
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])

    redirect to "/landmarks/#{@landmark.id}"
  end
  
end
