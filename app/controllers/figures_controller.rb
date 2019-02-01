class FiguresController < ApplicationController
  
  #create new figure form
  get '/figures/new' do 
    erb :'/figures/new'
  end
  
  #create new figure post route 
  post '/figures' do 
    @figure = Figure.create(params['figure'])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
  #list all figures 
  get '/figures' do
    erb :'/figures/index'
  end 
  
  #view a single figure
   get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  #show form for editing a single figures
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  
  #update figure
  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect("/figures/#{@figure.id}")
  end
 
end

