class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmarks = Landmark.all
    @landmark = Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end


  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
#    if !params[:landmark][:name].empty?
#      @figure.titles << Title.create(params[:title])
#    end
#    if !params[:landmark][:name].empty?
#      @figure.landmarks << Landmark.create(params[:landmark])
#    end
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

end
