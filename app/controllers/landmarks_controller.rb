class LandmarksController < ApplicationController
  
  get '/landmarks' do
  	@landmarks = Landmark.all
  	erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
  	 @landmarks = Landmark.all
  	 erb :'landmarks/new'
  end

  post '/landmarks' do
  	 landmark = Landmark.create(params[:name])
  	 landmark.year_completed = params[:year_completed] if params[:year_completed]

  	 landmark.save
  	 redirect to "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do 
  	@landmark = Landmark.find_by(id: params[:id])
  	erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
   	@landmark = Landmark.find_by(id: params[:id])
  	erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
  	landmark = Landmark.find_by(id: params[:id])
  	landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  	redirect to "/landmarks/#{landmark.id}"
  end
end
