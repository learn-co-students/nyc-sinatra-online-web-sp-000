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

  post '/figures' do
    binding.pry #check params to make sure existing titles and landmarks are already in the :figure hash so we only need to shovel in the new ones
    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    
    @figure.save

    redirect("/figures/#{@figure.id}")
  end


  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/index'
  end






end
