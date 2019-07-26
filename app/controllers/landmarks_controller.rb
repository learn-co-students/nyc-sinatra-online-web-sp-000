class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    # if !params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:title])
    # end
    # # binding.pry
    # if !params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end

    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    @landmark.update(params[:landmark])
    # if !params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:title])
    # end
    #
    # if !params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end

    redirect to "/landmarks/#{@landmark.id}"
  end


end
