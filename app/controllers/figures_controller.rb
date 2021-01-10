class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
      @figure.save
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      @figure.save
    end

    redirect "/figures/#{@figure.id}"
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

  patch '/figures/:id' do
    if !params[:figure].keys.include?("title_ids")
      params[:figure][:title_ids] = []
    end
    if !params[:figure].keys.include?("landmark_ids")
      params[:figure][:landmark_ids] = []
    end

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:figure][:name].empty?
      @figure.name = params[:figure][:name]
      @figure.save
    end
    if !params[:title][:name].empty?
      title = Title.find_or_create_by(params[:title])
      @figure.titles << title
      @figure.save
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(params[:landmark])
      @figure.landmarks << landmark
      @figure.save
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

end
