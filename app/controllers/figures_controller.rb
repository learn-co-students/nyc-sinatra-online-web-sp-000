class FiguresController < ApplicationController
  
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
    # binding.pry
    figure = Figure.find_or_create_by(name: params[:figure][:name])
    
    binding.pry
    if !params[:title][:name].empty?
      title = Title.find_or_create_by(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      figure.landmarks << landmark
    end

    figure.save

    redirect "/figures/#{params[:id]}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
