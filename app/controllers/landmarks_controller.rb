class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end


  get '/landmarks/new' do
    # @titles = Title.all
    # @landmarks = Landmark.all
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])

    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
        
    @landmark.save

    redirect("/landmarks/#{@landmark.id}")
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    erb :'landmarks/show'
  end


  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    @landmark.update(params[:landmark])
    # binding.pry
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figures])
    end
        #  binding.pry
    @landmark.save

    redirect("/landmarks/#{@landmark.id}")
  end

  
end
