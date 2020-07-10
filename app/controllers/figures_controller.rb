class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids] unless params[:figure][:title_ids] == nil
    @figure.landmark_ids = params[:figure][:landmark_ids] unless params[:figure][:landmark_ids] == nil

    if params[:title][:name] != ""
      @title = Title.create(name: params[:title][:name])
      @figure.title_ids = @title.id
    end

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:year][:number])
      @figure.landmark_ids = @landmark.id
    end

    @figure.save

    redirect to '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name] unless params[:figure][:name] == ""
    @figure.titles = params[:title][:name] unless params[:title][:name] == ""
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) unless params[:landmark][:name] == ""
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end


end
