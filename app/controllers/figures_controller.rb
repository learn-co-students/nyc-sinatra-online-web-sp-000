class FiguresController < ApplicationController
  # add controller methods
  
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end 
  
  post '/figures' do 
    # binding.pry
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
  end
  
  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save
    
    redirect "/figures/#{@figure.id}"
  end
  
end
