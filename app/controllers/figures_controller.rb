class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/new' do
    erb :'/figures/new'
  end
  
  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end
  
  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    
    erb :'/figures/edit'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    elsif !params["landmark"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
    end
  end
  
  patch "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    @figure.landmarks.clear
    @figure.update(name: params[:figure][:name])
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    redirect "figures/#{@figure.id}"
  end
  
end
