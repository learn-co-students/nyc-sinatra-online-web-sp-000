class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
  if ((params[:landmark][:name] != "") || (params[:landmark][:year_completed] != nil))
    @landmark = Landmark.create(params[:landmark])
  end 
    redirect "/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit' 
  end

  patch '/landmarks/:id' do 
  @landmark = Landmark.find(params[:id])
    if (!params[:landmark][:name].empty?)
      @landmark.update(name: params[:landmark][:name])
    end
    if (params[:landmark][:year_completed] != nil)
      @landmark.update(year_completed: params[:landmark][:year_completed])
    end
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
