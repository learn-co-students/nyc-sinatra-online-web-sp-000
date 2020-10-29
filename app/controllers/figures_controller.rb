class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all    
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
   
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmark = Landmark.all
    @title = Title.all
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure"]["name"]) 
    
    if !params["landmark"]["figure"]
      @figure.landmarks = Landmark.create(name: params["landmark"]["figure"])
    else
      @figure.landmarks = Landmark.find_by_id(params[:figure][:landmark_id])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
