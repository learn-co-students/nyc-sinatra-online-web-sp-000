class LandmarksController < ApplicationController

  get "/landmarks" do
    @landmarks = Landmark.all
    erb:"landmarks/index"
  end

  get "/landmarks/new" do
    @figures = Figure.all
    @landmarks = Landmark.all
    erb:"landmarks/new"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @figure = @landmark.figure

    erb:"landmarks/show"
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])

    @figure_name = params[:figure][:name]

    if !Figure.find_by(name: @figure_name)
      @figure = Figure.create(name: @figure_name)
      @landmark.figure = @figure
    end
  end

  get "/landmarks/:id/edit" do
    @figures = Figure.all
    @landmark = Landmark.find(params[:id])
    erb:"/landmarks/edit"
  end


  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    
    @figure_name = params[:figure][:name]

   
    if !Figure.find_by(name: @figure_name)
      @figure = Figure.create(name: @figure_name)
      @landmark.figure = @figure
    end
    
    redirect to "/landmarks/#{@landmark.id}"
  end
  
end
