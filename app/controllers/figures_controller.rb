class FiguresController < ApplicationController
  get '/figures' do
    # binding.pry
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/show"
  end

  post '/figures' do
    figure = Figure.new                         # Make the new figure & name it
    figure.name = params[:figure][:name]
    figure.save
    if params[:title][:name] != ''              #Check to see if a new title was given
      if !params[:figure][:title_ids]
        params[:figure][:title_ids] = []
      end
      title = Title.new
      title.name = params[:title][:name]
      title.save
      params[:figure][:title_ids] << title.id
    end
    figure.title_ids = params[:figure][:title_ids]
    if params[:landmark][:name] != ''              #Check to see if a new landmark was given
      landmark = Landmark.new
      landmark.name = params[:landmark][:name]
      if params[:landmark][:year_completed] != ''
        landmark.year_completed = params[:landmark][:year_completed]
      end
      landmark.save
      if !params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] = []
      end
      params[:figure][:landmark_ids] << landmark.id
    end
      figure.landmark_ids = params[:figure][:landmark_ids]
  end

  patch '/figures/:id' do
    figure = Figure.find_by(params[:id])
    figure.update(params[:figure])
    if params[:title][:name] != ''              #Check to see if a new title was given
      if !params[:figure][:title_ids]
        params[:figure][:title_ids] = []
      end
      title = Title.new
      title.name = params[:title][:name]
      title.save
      params[:figure][:title_ids] << title.id
    end
    figure.title_ids = params[:figure][:title_ids]
    if params[:landmark][:name] != ''              #Check to see if a new landmark was given
      landmark = Landmark.new
      landmark.name = params[:landmark][:name]
      if params[:landmark][:year_completed] != ''
        landmark.year_completed = params[:landmark][:year_completed]
      end
      landmark.save
      if !params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] = []
      end
      params[:figure][:landmark_ids] << landmark.id
    end
      figure.landmark_ids = params[:figure][:landmark_ids]
    redirect :"/figures/#{params[:id]}"
  end

  delete '/figures/:id' do

  end
end
