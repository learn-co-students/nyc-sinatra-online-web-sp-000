class LandmarksController < ApplicationController
  
  get '/landmarks' do 

    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do 

    erb :'/landmarks/new'
  end 

  post '/landmarks' do 
    @landmark = Landmark.new 

    redirect to :"/landmarks/#{@landmark.id}"
  end 

  get '/landmarks/:id/edit' do 

    erb :'/landmarks/edit'
  end 

  get '/landmarks/:id' do 
    
    erb :'/landmarks/show'
  end 

  patch '/landmarks/:id' do 
    
  end 
  
end
