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

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = @figure.titles
    @landmarks = @figure.landmarks
    #binding.pry
    erb :'figures/show'
  end

  post '/figures' do
    #binding.pry
    figure = Figure.create(name: params[:figure][:name])
    titles = []
    landmarks = []

    if params[:title][:name] != ""
      titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        titles << Title.find(title_id) unless titles.include?(Title.find(title_id))
      end
    end

    if params[:landmark][:name] != ""
      landmarks << Landmark.create(name: params[:landmark][:name])
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |l_id|
        landmarks << Landmark.find(l_id) unless landmarks.include?(Landmark.find(l_id))
      end
    end

    figure.titles = titles
    figure.landmarks = landmarks
    figure.save

    redirect to "/figures/#{figure.id}"

  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    
    titles = []
    landmarks = []

    if params[:title][:name] != ""
      titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        titles << Title.find(title_id)
      end
    end

    if params[:landmark][:name] != ""
      landmarks << Landmark.create(name: params[:landmark][:name])
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |l_id|
        landmarks << Landmark.find(l_id)
      end
    end

    figure.titles = titles
    figure.landmarks = landmarks
    figure.save

    redirect to "/figures/#{figure.id}"

  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end
end
