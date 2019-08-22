require 'pry'
class FiguresController < ApplicationController
  # add controller methods
  
   get '/figures' do
    @figures = Figure.all
    erb :'/figures/index' 
  end

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(:name => params[:figure][:name])
    #binding.pry
    @landmark= params[:landmark][:name]
    @title = params[:title][:name]
    @title_ids = params[:figure][:title_ids]
    @landmark_ids = params[:figure][:landmark_ids]
    @landmark= params[:landmark][:name]
    @title = params[:title][:name]
    @title_ids = params[:figure][:title_ids]
    @landmark_ids = params[:figure][:landmark_ids]
    #binding.pry
      if !@title.empty?
        t=Title.create(:name => @title)
        @figure.titles << t
      end
      if @title_ids
        @title_ids.each do |id|
          t=Title.find(id)
          @figure.titles << t
          @figure.save
      end
    end 
    
    
    if @landmark 
      l = Landmark.create(:name => params[:landmark][:name])
      @figure.landmarks << l
      @figure.save
    end
    if @landmark_ids
      @landmark_ids.each do |id|
        l=Landmark.find(id)
        @figure.landmarks << l
      end
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do 
   @title = params[:title]
   @title_ids= params[:figure][:title_id]
   @landmark= params[:landmark]
   @landmark_ids = params[:figure][:landmark_id]
   @figure = Figure.find(params[:id])
   @figure.name = params[:figure][:name]
   @figure.save
   redirect  "/figures/#{@figure.id}"
  end
  
  
  
  
  
end
