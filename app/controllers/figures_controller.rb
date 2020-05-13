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
  @figure = Figure.create(params[:figure])
  # TITLES 
  if (params[:title][:name] != "")
    @title = Title.create(params[:title])
    @figure.titles << @title 
  end 
  
  # LANDMARKS
    all_landmark_ids = params[:figure][:landmark_ids]
    if all_landmark_ids
      all_landmark_ids.each do |one_landmark_id|
        landmark = Landmark.find_by_id(one_landmark_id)
        @figure.landmarks << landmark
      end 
    end 
    # code below might not be functional
    if params[:landmark][:name]
      landmark = @figure.landmarks.build(params[:landmark])
    end 
    @figure.save
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
    @landmarks = Landmark.all
    erb :'/figures/edit' 
  end

  patch '/figures/:id' do 
  @figure = Figure.find(params[:id])
    if (!params[:figure][:name].empty?)
      @figure.update(name: params[:figure][:name])
    end 
    if (!params[:figure][:landmark][:name].empty?)
      landmark = Landmark.create(name: params[:figure][:landmark][:name], year_completed: params[:figure][:landmark][:year])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end