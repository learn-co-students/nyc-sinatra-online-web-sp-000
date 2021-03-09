require 'pry'
class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all 
    erb :'/figures/index'
  end

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])
    if params["title"]["name"] != ""
      @title = Title.create(params["title"]["name"])
      @figure.titles << @title
    end
    if params["landmark"]["name"] && !params["landmark"]["title"] != ""
      @landmark = Landmark.create(params["landmark"]["name"], params["landmark"]["year"])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do

  end

  patch '/figures/:id/edit' do

  end
end
