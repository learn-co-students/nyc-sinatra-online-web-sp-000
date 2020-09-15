class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmark = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @landmark = Landmark.all
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.all
    landmark = Landmark.create(:name => params[:landmark][:name], :year_completed => params[:landmark][:year_completed])    
    landmark.save
    # binding.pry
    redirect to "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    id = params[:id]
    @landmark = Landmark.find(id)
  
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
  @landmark = Landmark.find(params[:id])
  erb :"landmarks/edit"
  end

  post '/landmarks/:id' do
    id = params[:id]
    # binding.pry
    landmark = Landmark.find(id)
    name = params[:landmark][:name]
    year = params[:landmark][:year_completed]
    landmark.update(:name => name, :year_completed => year)
    redirect "/landmarks/#{id}"
  end
end
