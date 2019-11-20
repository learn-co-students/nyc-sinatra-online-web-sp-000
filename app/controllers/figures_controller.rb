class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'application/figures/index'
  end
  
  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
  erb :'application/figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find_by_id(params[:id])
    erb :'application/figures/show'
  end

  post '/figures' do
    
    @figure=Figure.create(params[:figure])
    @figure.title_ids=params[:figure][:title_ids]
    @figure.landmark_ids=params[:figure][:landmark_ids]
    if !params[:title].empty?
      @figure.titles<<Title.create(params[:title])
    end
    
    if !params[:landmark].empty?
      @figure.landmarks<<Landmark.create(name:params[:landmark][:name], year_completed:params[:year])
    end
  end

  get '/figures/:id/edit' do
    @figure=Figure.find_by_id(params[:id])
    erb :'application/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


end
