class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do 
    erb :'/figures/new'
  end

  post '/figures' do 
    figure = Figure.create(params[:figure])
    figure.landmark_ids = params[:figure][:landmark_ids]
    figure.titles = [Title.find_or_create_by(name: params[:title][:name])] if params[:title][:name] != ""
    figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if params[:landmark][:name] != ""
  end

  get '/figures' do 
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do 
    figure = Figure.find_by(id: params[:id])
    figure.update(params[:figure])
    figure.landmark_ids = params[:figure][:landmark_ids]
    figure.titles = [Title.find_or_create_by(name: params[:title][:name])] if params[:title][:name] != ""
    figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if params[:landmark][:name] != ""
    redirect "/figures/#{figure.id}"
  end

end
