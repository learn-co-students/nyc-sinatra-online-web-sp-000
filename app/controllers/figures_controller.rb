class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []

    unless params[:title][:name].empty?
      titles << Title.create(name: params[:title][:name])
    end

    unless params[:landmark][:name].empty?
      landmarks << Landmark.create(name: params[:landmark][:name])
    end

    figure = Figure.create( name: params[:figure][:name],
                            landmarks: landmarks,
                            titles: titles)
    redirect "figures/#{figure.id}"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  put '/figures/:id' do
    figure = Figure.find(params[:id])
    titles = params[:figure][:title_ids]&.map { |id| Title.find(id) } || []
    landmarks = params[:figure][:landmark_ids]&.map { |id| Landmark.find(id) } || []

    unless params[:title][:name].empty?
      titles << Title.create(name: params[:title][:name])
    end

    unless params[:landmark][:name].empty?
      landmarks << Landmark.create(name: params[:landmark][:name])
    end

    figure.name = params[:figure][:name]
    figure.titles = titles
    figure.landmarks = landmarks
    figure.save

    redirect "/figures/#{params[:id]}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end
end
