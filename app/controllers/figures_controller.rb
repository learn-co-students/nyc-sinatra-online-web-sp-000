class FiguresController < ApplicationController

  get '/figures' do

    erb :'/figures/index'
  end
  
  get '/figures/new' do 
    @figures = Figure.all 
    @landmarks = Landmark.all 
    @titles = Title.all

    erb :'/figures/new'
  end 

  post '/figures' do 
    @figure = Figure.new(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end 
  
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end 

    @figure.save 

    redirect to :"/figures/#{@figure.id}"
  end 

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end 

  get '/figures/:id' do  
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end 

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by_id(params[:id])
    @figure.update(:name => params["figure"]["name"])
    @figure.titles << Title.find_or_create_by(params["figure"]["title_ids"])
    #binding.pry
    @figures.landmarks << Landmark.find_or_create_by(params["figure"]["landmark_ids"])
    @figure.save

    redirect to :"/figures/#{@figure.id}"
  end 


end
