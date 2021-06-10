class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title_ids << params[:title_ids]
    @figure.landmark_ids << params[:landmark_ids]

    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end

    @figure.save

    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    @figure.title_ids << params[:title_ids]
    @figure.landmark_ids << params[:landmark_ids]

    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    end

    @figure.save

    redirect to "figures/#{@figure.id}"
  end


end
