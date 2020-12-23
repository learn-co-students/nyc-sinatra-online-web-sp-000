class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :'/figures/new'
  end
  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name] != ""
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = @figure.titles
    @landmarks = @figure.landmarks
    erb :'/figures/show'
  end
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end
  patch '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name] != ""
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    end
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
