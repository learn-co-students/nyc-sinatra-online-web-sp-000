class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    #create a new title if applicable
    if params[:title][:name] != ""
      @figure.titles << Title.create(params[:title])
    end

    #create a new landmark if applicable
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]

    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save

    redirect("/figures/#{@figure.id}")
  end


end
