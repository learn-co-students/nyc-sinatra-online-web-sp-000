class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  post '/figures' do
    figure_name = params[:figure][:name]
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      new_title = params[:title][:name]
      @title = Title.create(name: new_title)
      @figure.titles << @title
      @figure.save
    end

    if !params[:landmark][:name].empty?
      name = params[:landmark][:name]
      year = params[:landmark][:year_completed]
      @landmark = Landmark.create(name: name, year_completed: year, figure_id: @figure.id)
      @figure.landmarks << @landmark
      @figure.save
    end
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    if !params[:figure][:name].empty?
      @figure.name = params[:figure][:name]
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end

    @figure.save
        #binding.pry
    redirect to("/figures/#{@figure.id}")
  end

end
