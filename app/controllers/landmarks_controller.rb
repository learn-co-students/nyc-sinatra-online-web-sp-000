class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index' 
  end
  
  get '/landmarks/new' do
    @figures = Figure.all

    erb :'landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do 
    landmark = Landmark.find(params[:id])


    # update figure
    landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    landmark.save
    
    redirect to "figures/#{figure.id}"
  end
end
