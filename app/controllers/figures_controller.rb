class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
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

  post '/figures' do   
    #binding.pry
    @figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids]
      @title = Title.find(params[:figure][:title_ids][0].to_i)
      if @title 
        @figure.titles << @title
      end
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if params[:figure][:landmark_ids]
      @landmark = Landmark.find(params[:figure][:landmark_ids][0].to_i)
      if @landmark
        @figure.landmarks << @landmark
      end
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
  
    @figure.save
    redirect to "/figures/#{@figure.id}"
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