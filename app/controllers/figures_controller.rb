class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end

  # allows you to create a new figure with a title
  # allows you to create a new figure with a landmark
  # allows you to create a new figure with a new title
  # allows you to create a new figure with a new landmark
  # params = {"figure"=>{"name"=>"figure params", "title_ids"=>["1"]}, "title"=>{"name"=>""}, "landmark"=>{"name"=>"", "year"=>""}}
  post '/figures' do
    # #<Figure:0x00007f8f92d3a0f8 id: 502, name: "Doctor Who">
    @figure = Figure.create(params[:figure])
    binding.pry
    # #<Title:0x00007f8f91d072d0 id: 295, name: "Time Lord">
    @figure.titles = Title.create(name: params[:title][:name])

    # @figure.titles = @titles
    @figure.save

    # @figure.landmark = Landmark.find_or_create_by(name: params[:landmark][:name])


  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/edit'
  end

end
