class FiguresController < ApplicationController

  get '/figures' do
    @all_figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @all_titles = Title.all
    @all_landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    # Create a new title if necessary and add
    # to this new figure's titles
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end

    # Create a new landmark if necessary
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @all_titles = Title.all
    @all_landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    # Create a new title if necessary and add
    # to this new figure's titles
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end

    # Create a new landmark if necessary
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    redirect "/figures/#{@figure.id}"
  end

end
