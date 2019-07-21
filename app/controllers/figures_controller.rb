class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id].to_i)
    erb :'figures/show'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
       @figure.titles.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.create(name: params[:landmark][:name])
    end
    redirect :"figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id].to_i)
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
       @figure.titles.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks.create(name: params[:landmark][:name])
    end

    redirect :"figures/#{@figure.id}"
  end


end
