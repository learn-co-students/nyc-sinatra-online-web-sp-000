require 'pry'

class FiguresController < ApplicationController
  
  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb:'/figures/new' 
  end
  
  get '/figures' do 
    @figures= Figure.all 
    erb:'/figures/index'
  end 
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
  
    if params[:title][:name] != ""
      @title = Title.create(params[:title]) 
      @figure.titles << @title 
    end 

    if params[:landmark][:name] != ""
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark 
    end 
      @figure.save
    redirect to "/figures/#{@figure.id}"
  end 
  

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb:'/figures/show'
  end 

  get '/figures/:id/edit' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    @figure = Figure.find_by_id(params[:id])
    erb:'/figures/edit'
  end 

  patch '/figures/:id' do 
    binding.pry
    @figure = Figure.find_by_id(params[:id]) 
    @figure.name = params[:figure][:name]
    
      if params[:title][:name] != "" 
        @figure.titles << params[:title][:name]
      end 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:new_landmark]
    @figure.save 
    @landmark.save  
    redirect to "/figures/#{@figure.id}"
  end 

end
