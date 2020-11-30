class LandmarksController < ApplicationController
  get '/landmarks' do
    @ladnmarks = Landmark.all
    erb :'landmarks/index'
  end
end
