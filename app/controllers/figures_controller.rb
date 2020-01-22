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
    # binding.pry
    @figure = Figure.new(params[:figure][:name])

    if !params[:figure][:title_ids].empty?
      @figure_titles = []
      params[:figure][:title_ids].each do |id|
  
        @figure_titles << Title.select {|title| title.id == id}
      end
  
      @figure.titles = @figure_titles
    end
    


    @figure.landmarks = params[:figure][:landmarks]
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
