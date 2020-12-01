class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    #else
    #  @figure.title = params[:title]
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmarks])
    #else
    #  @figure.landmarks = params[:landmarks]
    end
    @figure.save
    redirect to "/figures/#{figure.id}"
  end
end
