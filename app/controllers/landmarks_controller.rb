class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"landmarks/index"
  end

  
end
