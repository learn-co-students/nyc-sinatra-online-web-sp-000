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
    @title = params[:title]
    @title_ids = params[:figure][:title_id]
    @landmark = params[:landmark]
    @landmark_ids = params[:landmark_id]
    
    @figure = Figure.create(:name => params[:figure][:name])
      if !@title[:name].empty?
        t=Title.create(:name => @title[:name])
        @figure.titles << t
      end
      if @title_ids
        @title_ids.each do |id|
          t=Title.find(id)
          @figure.titles << t
      end
    end 
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
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
    erb :'/figures/edit'
  end

  get '/owners/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do 
   
  end
  
  
  
  
  
end
