class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    f = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      f.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      f.landmarks << Landmark.create(params[:landmark])
    end
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      f.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      f.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures/#{@figure.id}"
  end

end
