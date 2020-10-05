class FiguresController < ApplicationController
  
  #create
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    new_figure = Figure.create(params[:figure])
    new_figure.titles.create(params[:title]) if !params[:title][:name].empty?
    new_figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty? # && !params[:landmark][:year_completed].empty?
  end

  #read
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  #update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    edit_figure = Figure.find(params[:id])
    edit_figure.update(params[:figure])
    edit_figure.titles.create(params[:title]) if !params[:title][:name].empty?
    edit_figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty? # && !params[:landmark][:year_completed].empty?
    redirect "/figures/#{params[:id]}"
  end

  #delete

end
