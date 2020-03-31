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
    #binding.pry
    @figure = Figure.new(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end 
    #binding.pry 
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end 

    #binding.pry
  
    @figure.save 
    #binding.pry 
    redirect to :"/figures/#{@figure.id}"
  end 

end
