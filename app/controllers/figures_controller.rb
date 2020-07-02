class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    erb :"figures/show"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    if !params["figure"]["name"].empty?
      @figure.name = params["figure"]["name"]
    end
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    erb :"figures/#{@figure.id}"
  end
end
