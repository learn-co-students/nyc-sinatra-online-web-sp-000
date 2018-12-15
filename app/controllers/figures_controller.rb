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
  
  get 'figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
  end
end
