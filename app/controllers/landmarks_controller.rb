class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end

end
