class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.new(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    elsif !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
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
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    elsif !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end
end
