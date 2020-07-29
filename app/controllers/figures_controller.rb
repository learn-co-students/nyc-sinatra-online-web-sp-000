class FiguresController < ApplicationController
  
  
  get '/figures' do 
    @figure = Figure.all
    erb :'figures/index'
  end 

  get '/figures/new' do 
    erb :'figures/new'
  end 

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end 

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:figure][:title]) 
    end 

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:figure][:landmark])
    end 

    @figure.save
  end 

  patch '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])

    if !params.empty?
      @figure.name = params[:figure][:name]
    end 

    @figure.save
  end 



end
