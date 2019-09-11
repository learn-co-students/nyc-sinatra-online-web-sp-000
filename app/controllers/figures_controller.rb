class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    if Figure.exists?(name: params[:figure][:name])
      @figure = Figure.find_by(name: params[:figure][:name])
    else
      @figure = Figure.create(name: params[:figure][:name])
    end

    if params[:title][:name] != ""
      if Title.exists?(name: params[:title][:name])
        @title = Title.find_by(name: params[:title][:name])
      else
        @title = Title.create(name: params[:title][:name])
      end
      @figure.titles << @title
    end

    if params[:figure].key?(:title_ids)
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id.to_i)
      end
    end
    
    if params[:landmark][:name] != ""
      if Landmark.exists?(name: params[:landmark][:name])
        @landmark = Landmark.find_by(name: params[:landmark][:name])
      else
        @landmark = Landmark.create(name: params[:landmark][:name])
        if params[:landmark][:year] != ""
          @landmark.year_completed = params[:landmark][:year].to_i
          @landmark.save
        end
      end
      @figure.landmarks << @landmark
    end
    if params[:figure].key?(:landmark_ids)
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id.to_i)
      end
    end    
    @figure.save

    redirect to ('/figures')
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    erb :'/figures/edit'
  end


end
