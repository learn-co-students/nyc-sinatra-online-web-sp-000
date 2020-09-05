class FiguresController < ApplicationController
  
  get '/figures' do 
    erb :'/figures/index'
  end 

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    
    params[:figure][:title_ids].each do |id|
      @figure.titles << Title.find(id)
    end 
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end 

    params[:figure][:landmark_ids].each do |id|
      @figure.landmarks << Landmark.find(id)
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year: params[:landmark][:year])
    end

  end 

  
  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :'/figures/new'
  end 



end
