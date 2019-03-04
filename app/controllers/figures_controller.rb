class FiguresController < ApplicationController
  get '/figures/new' do 
    erb :'figures/new'
  end 
  
  post '/figures' do 
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(name: params[:title][:name]) 
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
  
    @figure.save
    
    redirect '/figures'
  end 
  
  get '/figures' do 
    erb :'/figures/index'
  end 
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end 
  
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])

    @figure.save
 
    redirect "/figures/#{@figure.id}"
  end 
end
