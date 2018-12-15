class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end
  
  get'/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect :"/figures/#{@figure.id}"
  end
  
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
