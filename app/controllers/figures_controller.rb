class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb:'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb:'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb:'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb:'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.landmarks.clear
    @figure.titles.clear
    @figure.update(params[:figure])
    
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    redirect to "/figures/#{@figure.id}"
  end

end
