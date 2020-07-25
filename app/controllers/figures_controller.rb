class FiguresController < ApplicationController
  
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
    erb :'figures/show'
  end

  post '/figures' do
    binding.pry
    figure = Figure.new(name: params[:figure][:name])
    landmarks = params[:figure][:landmark_ids].map do |id|
      Landmark.find(id)
    end
    titles = params[:figure][:title_ids].map do |id|
      Title.find(id)
    end
    if !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name])
      landmarks << new_landmark
    end
    if !params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      titles << new_title
    end
    figure.landmarks << landmarks
    figure.titles << titles
    figure.save
    redirect to "/figures/#{figure.id}"
  end

end
