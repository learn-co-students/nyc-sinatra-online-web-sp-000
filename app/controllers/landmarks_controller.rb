class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do
    @titles = Title.all
    # binding.pry
    erb :"/landmarks/new"
  end
  post '/landmarks/new' do
    # @figure = Figure.create(params['figure'])
    # if params[:title]['name']!=""
    #   @figure.titles << Title.create(params[:title])
    # end
    # if params[:landmark]['name']!=""
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end
    # @figure.save
    # redirect to "/landmarks/#{@figure.id}"
    @figure = Figure.create(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    # binding.pry
    redirect to "/landmarks/#{@figure.id}"
  end
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    # binding.pry
    erb :'/landmarks/show'
  end
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    # unless params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end

    # unless params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:title])
    # end
    @landmark.save
    redirect to "/landmarks/#{@figure.id}"
  end
  get '/landmarks' do
    erb :'/landmarks/index'
  end
end
