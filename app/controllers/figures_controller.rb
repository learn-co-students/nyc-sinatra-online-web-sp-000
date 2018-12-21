class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figures.all 
    erb :"figures/index"
  end
  
  post '/figures/index' do 
    @title = Params[:title]
    @title_ids = Params[:figure][:title_ids]
    @landmark = Params[:landmark]
    @landmark_ids = Params[:figure][:landmark_ids]
  end 
  
  
  get '/figures/new' do 
    
  end 

end #end of the class 
