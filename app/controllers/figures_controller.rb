class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do 
    erb :'/figures/index'
  end 

  get '/figures/new' do 
    erb :'/figures/new'
  end 

  get '/figures/:id' do 
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end 

  get '/figures/:id/edit' do 
    #binding.pry
    @figure = Figure.find_by(params[:id])
    erb :'/figures/edit'
  end 

  post '/figures' do 
    #binding.pry
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 

    @figure.save 

    redirect "/figures/#{@figure.id}"
  end 

  patch '/figures/:id' do 
    #binding.pry
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 

    @figure.save 

    redirect "/figures/#{@figure.id}"

  end 
end
