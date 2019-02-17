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
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  post '/figures' do
    puts params
    @figure = Figure.create(name: params[:figure][:name])
    if params[:title][:name].length > 0
      @figure.titles << Title.create(name: params[:title][:name])
    else
      @figure.title_ids = params[:figure][:title_ids]
    end
    if params[:landmark][:name].length > 0
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], figure_id: @figure.id, year_completed: params[""])
    else
      @figure.landmark_ids = params[:figure][:landmark_ids]
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    ##if a new name was submitted, update figure name.
    if params[:figure][:name]
      @figure.name = params[:figure][:name]
    end
    ##if ALREADY EXISTING titles/landmarks for this figure were submitted,
    ##clear out old title/landmark info for this figure and update.
    if params[:figure][:title_ids]
      @figure.titles.clear
      @figure.title_ids.clear
      params[:figure][:title_ids].each do |t|
        @figure.title_ids << t
        @figure.titles << Title.find(t)
      end
    end
    if params[:figure][:landmark_ids]
      @figure.landmarks.clear
      @figure.landmark_ids.clear
      params[:figure][:landmark_ids].each do |l|
        @figure.landmark_ids << l
        @figure.landmarks << Landmark.find(l)
      end
    end
    ##if NEW titles/landmarks for this figure were submitted (via text input),
    ##create new instances for them,
    ##then add them to the figure being updated.
    if params[:title]
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if params[:landmark]
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], figure_id: @figure.id, year_completed: params[""])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
