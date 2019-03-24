class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])  
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    if !params[:figure_name].empty?
      @figure = Figure.create(:name => params[:figure_name])
      @figure.landmarks << @landmark
    end
    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    if @landmark
        erb :'/landmarks/edit'
    else
      redirect "/landmarks"
    end
  end

  patch '/landmarks/:id' do 
     
      @landmark = Landmark.find(params[:id])
      @landmark.update(params["landmark"])
      if !params["figure"]["name"].empty?
        @figure = Figure.create(name: params["figure"]["name"])
        @figure.landmarks << @landmark
      end
      redirect to "landmarks/#{@landmark.id}"
  end
end
