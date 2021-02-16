class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(:name => params[:landmark][:name])

    if !params[:landmark][:year_completed].empty?
        @landmark.year_completed = params[:landmark][:year_completed]
    end
    @landmark.save
    redirect to("/landmarks/#{@landmark.id}")
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @updated_landmark = Landmark.find_by_id(params[:id])

    if !params[:landmark][:name].empty?
      @updated_landmark.name = params[:landmark][:name]
    end

    if !params[:landmark][:year_completed].empty?
      @updated_landmark.year_completed = params[:landmark][:year_completed]
    end
    @updated_landmark.save
    redirect to("/landmarks/#{@updated_landmark.id}")
  end

end
