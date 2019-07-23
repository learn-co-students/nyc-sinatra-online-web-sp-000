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
  @figure = Figure.new(name: params[:figure][:name])
#  binding.pry

  if !params["title"]["name"].empty?
  @figure.title << Title.find_or_create_by(name: params["title"]["name"])
  end
#  @figure.title = Title.find_or_create_by(name: params["title"]["name"])
#  @figure.landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
#  @figure.title_ids = params["figure"]["title_ids"]
#binding.pry
end



















end
