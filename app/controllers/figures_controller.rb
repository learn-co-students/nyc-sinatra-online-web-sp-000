class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all 
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    # @titles = FigureTitle.find_by(figure_id: @figure.id)
    # @landmarks = @figure.landmarks
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    # @titles = FigureTitle.find_by(figure_id: @figure.id)
    # @landmarks = Landmarks.all
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
