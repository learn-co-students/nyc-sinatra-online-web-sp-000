class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"landmarks/index"
  end

  get "/landmarks/new" do     #view form to create new landmark
    erb :"landmarks/new"
  end

  get "/landmarks/:id" do     #allows you to edit a single landmark
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do    #allows to view form to edit sindle landmark?
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])

    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

  post "/landmarks" do            #allows you to create a new landmark
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect "/landmarks"
  end
end
