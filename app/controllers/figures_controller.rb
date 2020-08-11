class FiguresController < ApplicationController
  
  get '/figures' do
    @figure = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figure = Figure.all
    @title = Title.all
    @landmark = Landmark.all
  erb :'/figures/new'
  end

  post '/figures' do
      @figure = params[:figure][:name]
      
      figure = Figure.create(:name => @figure)
      figure.save
      landmark = Landmark.create(:name => params[:landmark][:name])
      landmark.figure = figure
      landmark.save
      title = Title.create(:name => params[:title][:name])
      title.save
      figure_title = FigureTitle.create(:figure_id => figure.id, :title_id => title.id)
      figure_title.save
      
      redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.all
    
    erb :'/figures/show'
  end
end
