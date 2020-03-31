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

end
