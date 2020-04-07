class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params["figure"])

    if !params["title"]["name"].empty?
      @figure.title = Title.find_or_create_by(params["title"])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmark << Landmark.find_or_create_by(params["landmark"])
    end

    @landmark.year_completed = params["landmark"]["year_completed"]

    @landmark.save

    redirect to "/figures/#{@figure.id}"

  end

  get '/figures/:id' do

    @figure = Figure.find(id: params[:id])

    erb :'/figures/show'
  end


  get '/figures/:id/edit' do

    @figure = Figure.find(id: params[:id])

    erb :'/figures/edit'
  end
end
