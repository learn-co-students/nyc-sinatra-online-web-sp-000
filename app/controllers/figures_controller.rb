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
   @title = params[:title][:name]
   @title_ids= params[:figure][:title_ids]
   @landmark= params[:landmark][:name]
   @landmark_ids = params[:figure][:landmark_ids]
   @figure = Figure.find(params[:id])
   old_landmark = Landmark.find(params[:figure][:landmark_ids]).first
   old_landmark.name = @landmark
   old_landmark.save
   #binding.pry
   #@figure.landmarks << Landmark.find_by(name: @landmark)
   @figure.name = params[:figure][:name]
   @figure.save
   #binding.pry
   redirect  "/figures/#{@figure.id}"
  end
  
  
  
  
  
end
