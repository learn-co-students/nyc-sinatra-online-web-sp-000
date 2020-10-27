class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get "/landmarks/:id" do
    @landmark=Landmark.find_by(:id => params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark=Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure << Landmark.create(params[:figure])
    end
    @landmark.save
     redirect("/landmarks/#{@landmark.id}")
    end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find_by(:id => params[:id])
      erb :'/landmarks/edit'
    end

    patch '/landmarks/:id' do
      @landmark = Landmark.find_by(:id => params[:id])
      @landmark.update(params[:landmark])
      if !params[:figure][:name].empty?
        @landmark.figure << Landmark.create(params[:figure])
      end
      @landmark.save
      redirect("/landmarks/#{@landmark.id}")
  end
end
