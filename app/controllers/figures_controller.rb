class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all 
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  
  get '/figures/:id/edit' do 
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.titles.clear
    @figure.landmarks.clear
    @figure.update(name: params[:figure][:name])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    redirect to "/figures/#{@figure.id}"
  end
end
