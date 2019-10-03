class FiguresController < ApplicationController
  
   get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/new' do  
    erb :'/figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.titles = params[:title_ids]
  end
end
