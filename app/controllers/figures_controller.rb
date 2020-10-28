class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    @figure.save

    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    else
      @figure.title_ids = params[:figure][:title_ids]
      @figure.save
    end

    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      @figure.landmark_ids = params[:figure][:landmark_ids]
      @figure.save
    end
    redirect to("figures/#{params[:id]}")
  end

end
