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

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @title_ids = params[:figure][:title_ids]
    if @title_ids != nil
      @titles = @title_ids.collect do |id|
        Title.find(id)
      end
      @titles.each do |title|
        @figure.titles << title
      end
    end

    if params[:title][:name] != nil
      @figure.titles << Title.create(name: params[:title][:name])
    end

    @landmark_ids = params[:figure][:landmark_ids]
    if @landmark_ids != nil
      @landmarks = @landmark_ids.collect do |id|
        Landmark.find(id)
      end
      @landmarks.each do |landmark|
        @figure.landmarks << landmark
      end
    end
    
    if params[:landmark][:name] != nil
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    
    if params[:figure][:name] != nil
      @figure.name = params[:figure][:name]
    end

    @title_ids = params[:figure][:title_ids]
    if @title_ids != nil
      @titles = @title_ids.collect do |id|
        Title.find(id)
      end
      @titles.each do |title|
        @figure.titles << title
      end
    end

    if params[:title][:name] != nil
      @figure.titles << Title.create(name: params[:title][:name])
    end

    @landmark_ids = params[:figure][:landmark_ids]
    if @landmark_ids != nil
      @landmarks = @landmark_ids.collect do |id|
        Landmark.find(id)
      end
      @landmarks.each do |landmark|
        @figure.landmarks << landmark
      end
    end
    
    if params[:landmark][:name] != nil
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    redirect :"/figures/#{params[:id]}"
  end

end
