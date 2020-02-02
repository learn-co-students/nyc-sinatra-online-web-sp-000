class FiguresController < ApplicationController
  # add controller methods

  get "/figures" do
    @figures = Figure.all
    erb:"figures/index"
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb:"figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb:"figures/show"
  end

  post "/figures" do

    @figure = Figure.create(params[:figure])

    @title_name = params[:title][:name]
    @landmark_name = params[:landmark][:name]

    if !Title.find_by(name: @title_name)
      @title = Title.create(name: @title_name)
      @figure.titles << @title
    end

    if !Landmark.find_by(name: @t_name)
      @landmark = Landmark.create(name: @landmark_name)
      @figure.landmarks << @landmark
    end
  
  end

  patch "/figures/:id/edit" do
    "Figures Update Route"
  end

  
end
