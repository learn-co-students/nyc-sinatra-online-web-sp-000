class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    # binding.pry
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
    # binding.pry
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # check to see if new Title/Figure field is not empty.  If so, create a new figure/title and associate it with the figure.
    if params[:title][:name] != "" && params[:title][:name] != nil
      @figure.titles << Title.create(name: params[:title][:name])
    elsif params[:landmark][:name] != "" && params[:landmark][:name] != nil
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    # might be some repetition here, need logic to check if title already exists?
    redirect to("/figures/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    # binding.pry
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    @figure.save
    redirect to("/figures/#{@figure.id}")
  end


end
