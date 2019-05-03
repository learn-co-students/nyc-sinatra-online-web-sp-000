class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])
    @title = Title.find_or_create_by(params[:title])
    @figure.titles << @title
    @title.figures << @figure
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @landmark.figure_id = @figure.id
    @figure.landmarks << @landmark
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by(params[:id])
    @figure.name = params[:figure][:name]
    @title = Title.find_or_create_by(params[:title])
    @figure.titles << @title
    @title.figures << @figure
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @landmark.figure_id = @figure.id
    @figure.landmarks << @landmark
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end


end
