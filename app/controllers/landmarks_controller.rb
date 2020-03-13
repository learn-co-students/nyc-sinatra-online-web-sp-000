class LandmarksController < ApplicationController

  get '/landmarks' do

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    
    erb :'landmarks/new'
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    @landmark.figure = Figure.create
    
    redirect to "/landmarks/#{@landmark.slug}"
  end

  get '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])

    erb :'landmarks/show'
  end

  get '/landmarks/:slug/edit' do
    @landmark = Landmark.find_by_slug(params[:slug])

    erb :'landmarks/edit'
  end

  patch '/landmarks/:slug' do
    @landmark = Landmark.find_by_slug(params[:slug])
    @landmark.update(params[:landmark])
    if !params[:figure][:name] == @figure.name
      @landmark.figure = Figure.create(params[:figure])
    end
    @landmark.save
    
    redirect to "/landmarks/#{@landmark.slug}"
  end
end
