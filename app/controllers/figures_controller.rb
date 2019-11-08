class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure][:name])

    if params[:landmark][:name] != ""
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name], figure_id: @figure.id, year_completed: params[:landmark][:year_completed])
      @landmark.save
    end

    if params[:title][:name] != ""
      @title = Title.find_or_create_by(name: params[:title][:name])
      @title.save
      FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: @title.id)
    end

    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |name|
        @figure.titles << Title.find_by(name: name)
      end
    end

    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |name|
        @figure.landmarks << Landmark.find_by(name: name)
      end
    end

    redirect to "/figures/#{ @figure.id }"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if params[:landmark][:name] != ""
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name], figure_id: @figure.id, year_completed: params[:landmark][:year_completed])
      @landmark.save
    end

    if params[:title][:name] != ""
      @title = Title.find_or_create_by(name: params[:title][:name])
      @title.save
      FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: @title.id)
    end

    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |name|
        @figure.titles << Title.find_by(name: name)
      end
    end

    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |name|
        @figure.landmarks << Landmark.find_by(name: name)
      end
    end

    redirect to "/figures/#{ @figure.id }"
  end



end
