class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure]
    figure.landmarks = params[:landmark]
    if params[:landmark][:name]
      figure.landmarks << Landmark.create(params[:landmark])
    end

    figure.titles = params[:title]
    if params[:titles][:name]
      figure.titles << Titles.create(params[:title])
    end
    figure.save
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end



end
