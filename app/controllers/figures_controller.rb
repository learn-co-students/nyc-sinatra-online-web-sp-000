class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    
    erb :'figures/new'
  end

  post '/figures' do
    
    @figure = Figure.new(params[:figure])
    # binding.pry
    if !params[:title].empty?
      @figure.titles << Title.new(params[:title]) 
    end

    if !params[:landmark].empty?
      @figure.landmarks << Landmark.new(params[:landmark]) 
    end

    @figure.save

    #redirect to ind page
  end

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all

    erb :'figures/edit' 
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmarks.create(params[:landmark])
    binding.pry
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

end
