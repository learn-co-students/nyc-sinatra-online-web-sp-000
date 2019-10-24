class LandmarksController < ApplicationController
  
  get '/landmarks/new' do 
    @landmark = Landmark.create(params[:landmark])
    erb:'/landmarks/new'
  end 





end
