class FiguresController < ApplicationController
  
  get '/figures/new' do 
    @figures = Figure.all 
    @landmarks = Landmark.all 
    @titles = Title.all 
    
    erb :'/figures/new'
  end 

  post '/figures' do 
    @figure = Figure.new

    redirect to :"/figures/#{@figure.id}"
  end 

end
