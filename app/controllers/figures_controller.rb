require 'pry'

class FiguresController < ApplicationController
  
  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb:'/figures/new' 
  end
  
  
  get '/figures' do 
    @figures= Figure.all 
    erb:'/figures/index'
  end 
end
