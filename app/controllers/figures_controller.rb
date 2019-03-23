require 'pry'

class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
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


  post '/figures' do
    figure = Figure.create(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"], landmark_ids: params["figure"]["landmark_ids"])
    if !params["title"]["name"].empty?
      title = Title.create(name: params["title"]["name"])
      figure.titles << title
    end
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(name: params["landmark"]["name"])
      figure.landmarks << landmark
    end

    redirect to "/figures/#{figure.id}"

  end

  patch '/figures/:id' do
    figure = Figure.find_by(id: params[:id])

    figure.update(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"], landmark_ids: params["figure"]["landmark_ids"])

    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(name: params["landmark"]["name"])
      figure.landmarks << landmark
    end

    if !params["title"]["name"].empty?
      title = Title.create(name: params["title"]["name"])
      figure.titles << title
    end

    redirect to "/figures/#{figure.id}"
  end


end
