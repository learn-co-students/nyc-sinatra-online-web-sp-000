class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all

  erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do

    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]
    @figure = Figure.create(:name => params[:figure][:name])
    params
    if !params[:title][:name].empty?
      title = Title.create(:name => params[:title][:name])
      @figure.titles << title
    end
    # binding.pry
    if params[:figure][:title_ids]

      title = Title.find
    end
  end
end
