class FiguresController < ApplicationController
  get "/figures/new" do
    erb :'figures/new'
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post "/figures" do
    @figure = Figure.new(params[:figure])
    if params[:title][:name].size > 0
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name].size > 0
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id]).update(params[:figure])
    if params[:title][:name].size > 0
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name].size > 0
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
  end

  get "/figures" do
    erb :'figures/index'
  end
end
