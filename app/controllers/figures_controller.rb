class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end 

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id)
      end 
    end

    if params[:title][:name]
      @figure.titles << Title.create(name: params[:title][:name])
    end 
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end 
  
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    
  end 

  
  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :'/figures/new'
  end 



end
