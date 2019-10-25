require 'pry'
class LandmarksController < ApplicationController
  
  get '/landmarks/new' do 
    erb:'/landmarks/new'
  end 

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb:'landmarks/index'
  end 

  post '/landmarks' do 
    @landmarks = Landmark.create(params["landmark"])
    erb:'/landmarks/show'
  end 

  



end
