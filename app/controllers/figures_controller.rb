class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all.sort_by{|figure| figure.name }
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figure = Figure.all.sort_by{|figure| figure.name }
    @titles = Title.all
    @landmarks = Landmark.all.sort_by{|landmark| landmark.name }
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks = Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.titles = Title.find_or_create_by(name: params[:title][:name])
    @figure.save
    redirect to("/figures/#{@figure.id}")
  end

  get '/figures/id' do
    
  end
end
