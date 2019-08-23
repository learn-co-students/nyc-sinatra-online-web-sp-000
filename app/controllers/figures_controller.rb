class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])
    if params[:title][:name]
      @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    end
    if params[:landmark][:name]
      @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark][:name])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.title = Title.find_or_create_by(:name => params[:figure][:title][:name])
    @figure.landmark = Landmark.find_or_create_by(:name => params[:figure][:landmark])
    @figure.save
    erb :'/figures/show'
  end
end
