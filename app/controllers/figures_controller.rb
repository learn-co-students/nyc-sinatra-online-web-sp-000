class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params['figure'])

    unless params['landmark']['name'] == null
      @landmark = Landmark.create(params['landmark']['name'])
      @figure.landmarks << @landmark
    end
    
    unless params['title']['name'] == null
      @title = Title.create(params['title']['name'])

      @figure.titles << @title
    end
    # binding.pry
    @figure.save
    redirect to "/figures/#{@figure.id}"

  end

end
