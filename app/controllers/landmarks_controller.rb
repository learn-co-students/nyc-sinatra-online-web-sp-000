class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks=Landmark.all
    erb :'landmarks/index'
  end
  
  get '/landmarks/new' do
    @landmarks=Landmark.all
    @landmarks=Landmark.all
  erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark=Landmark.create(params[:landmark])
    redirect to '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark=Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    #unless params[:title][:name].empty?
      #@figure.titles << Title.create(params[:title])
    #end
    #unless params[:landmark][:name].empty?
      #@figure.landmarks << Landmark.create(params[:landmark])
    
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end


end

