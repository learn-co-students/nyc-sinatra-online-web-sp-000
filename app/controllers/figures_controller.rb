class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(params[:figure])

    if !params[title][name].empty?
      @figure.titles << Title.find_or_create_by(params[:title])
    end

    if !params[landmark][name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
  end
end
