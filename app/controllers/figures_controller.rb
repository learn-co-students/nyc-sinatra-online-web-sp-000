class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @figure = Figure.new(params)
    erb :'/figures/new'
  end

  # post '/figures' do
  #   @figure = Figure.create(params[:figure])
  #   @figure.save
  # end

end
