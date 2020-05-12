class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    # TITLES 
    # if title_name
    if !(params[:title][:name] == "")
      @title = Title.create(name: params[:title][:name])
      FigureTitle.create(figure_id: @figure.id, title_id: @title.id)
    end 
    # if no title_name
    if !(params[:figure][:title_ids] == nil) # has to be == nil, not == "" because integer 
      all_title_ids = params[:figure][:title_ids]
      all_title_ids.each do |one_title_id|
        FigureTitle.create(figure_id: @figure.id, title_id: one_title_id)
      end 
    end 

    # LANDMARKS
    # if landmark_ids
    if !(params[:figure][:landmark_ids] == nil) # has to be == nil, not == "" because integer
      all_landmark_ids = params[:figure][:landmark_ids]
      all_landmark_ids.each do |one_landmark_id|
        correct_landmark = Landmark.find_by_id(one_landmark_id)
        correct_landmark_name = correct_landmark.name
        correct_landmark_year = correct_landmark.year_completed
        binding.pry
        @landmark = Landmark.create(name: correct_landmark_name, year_completed: correct_landmark_year)
        @figures.landmarks << @landmark
      end 
      binding.pry
    end
    # if landmark_name
    if !(params[:landmark][:name] == "")
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year], figure_id: @figure.id)
    end
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    @titles = FigureTitle.find_by(figure_id: @figure.id)
    @landmarks = @figure.landmarks
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    erb :'/figures/edit' 
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    redirect "/figures/#{@figure.id}"
  end
end