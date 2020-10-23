class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :"landmarks/new"
  end

  post '/landmarks' do
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.new(params[:landmark])
    end

    if !params[:title][:name].empty?
      @title = Title.find_by(name: params[:title][:name])
     
      if !@title
        @title = Title.create(params[:title])
      end
      @figure.titles << @title
    end
   
    if !params[:figure][:name].empty?
      @figure = Figure.find_by(name: params[:figure][:name])
     
      if !@figure
        @figure = Figure.create(name: params[:landmark][:name])
      end

      @landmark.figure_id = @figure.id
      
    end
    @landmark.save
    
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @titles = Title.all
    @figures = Figure.all
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
        if !params[:figure].keys.include?("landmark_ids")
          params[:figure]["landmark_ids"] =[]
        end
    
        @landmark= Landmark.find(params[:id])
        @landmark.update(params["landmark"])
    
        if !params["landmark"]["name"].empty?
          @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
        end
     
       
        redirect "landmarks/#{@landmark.id}"
  end

end
