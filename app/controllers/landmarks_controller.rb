class LandmarksController < ApplicationController
  # add controller methods
  
  #index
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'landmark/index'
  end

  #new  
  get '/landmarks/new' do
    erb 'landmarks/new'
  end
  
  post '/landmarks/new' do
    @landmarks = Landmark.new(params[:name], params[year])
    @landmark.save
end

  #show 
  get '/landmarks/:id'
  @landmark = Landmark.find_by_id(params[:id])
  erb :'landmarks/show'
  
  #edit 
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end
  
  post '/landmarks/id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark = Landmark.name(params[:name])
    @landmark = Landmark.year_completed(params[:year_completed])
    @landmark = Landmark.save
    redirect '/landmarks/#{params[:id]}'
  end

end

