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

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end

  # allows you to create a new figure with a title
  # allows you to create a new figure with a landmark
  # allows you to create a new figure with a new title
  # allows you to create a new figure with a new landmark
  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(name: params[:title][:name])
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    @figure.save
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.landmarks = params[:figure][:landmark_ids]

    redirect "figures/#{@figure.id}"
  end

end
