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
