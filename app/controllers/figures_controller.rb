class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    
    erb :"figures/new"
  end

  post '/figures' do
    binding.pry
    #finish creating POST
    
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    
    erb :'/figures/show'
  end

end
