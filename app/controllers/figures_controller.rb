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
    binding.pry
    figure = Figure.find_or_create_by(name: params[:figure][:name])
    title = Title.find_or_create_by(name: params[:title][:name])
    landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    figure.titles << title
    figure.save
    landmark.figure_id = figure.id
    landmark.save

    redirect "/figures/#{params[:id]}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end
