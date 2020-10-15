class FiguresController < ApplicationController

  ### create ###
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'figures/new'
  end


  post '/figures' do 
    # binding.pry
    @figure = Figure.create(params[:figure])
   unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
   end
    unless params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
    end 
    @figure.save
# binding.pry
    redirect "/figures/#{@figure.id}"
  end

  ### read ###
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  ### update ###

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.save
    
    redirect "/figures/#{@figure.id}"
  end

end
