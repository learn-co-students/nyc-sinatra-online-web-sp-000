class FiguresController < ApplicationController
  # Rack Flash
  require 'rack-flash'
  enable :sessions
  use Rack::Flash

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      figure.titles << Title.create(params[:title])
      figure.save
    end
    if !params["landmark"]["name"].empty?
      figure.landmarks << Landmark.create(params[:landmark])
      figure.save
    end
    flash[:message] = "Successfully created figure."
    redirect "figures/#{figure.id}"
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
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if !params["title"]["name"].empty?
      figure.titles << Title.create(params[:title])
      figure.save
    end
    if !params["landmark"]["name"].empty?
      figure.landmarks << Landmark.create(params[:landmark])
      figure.save
    end
    flash[:message] = "Successfully edited figure."
    redirect "figures/#{figure.id}"
  end
end
