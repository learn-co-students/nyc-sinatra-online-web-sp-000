class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all
    # binding.pry
    erb :"/figures/new"
  end
  post '/figures/new' do
    # @figure = Figure.create(params['figure'])
    # if params[:title]['name']!=""
    #   @figure.titles << Title.create(params[:title])
    # end
    # if params[:landmark]['name']!=""
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end
    # @figure.save
    # redirect to "/figures/#{@figure.id}"
    @figure = Figure.create(params['figure'])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    # binding.pry
    redirect to "/figures/#{@figure.id}"
  end
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'/figures/show'
  end
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  get '/figures' do
    erb :'/figures/index'
  end
end
