class FiguresController < ApplicationController
  # add controller methods
  
   get '/figures' do
    @figures = Figure.all
    erb :'/figures/index' 
  end

  get '/figures/new' do 
    @titles = Title.all
    @figures = Figure.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do 
    
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/owners/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do 
   
  end
  
  
  
  
  
end
