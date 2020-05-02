class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    new_figure = Figure.create(params[:figure])
    new_figure.titles << Title.create(params[:title]) if !params[:title].empty?
    new_figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark].empty?
    redirect "/figures/#{new_figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    params[:figure][:title_ids] ||= []
    params[:figure][:landmark_ids] ||= []
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles << Title.create(params[:title]) if !params[:title].empty?
    figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark].empty?
    redirect "/figures/#{figure.id}"
  end
end
