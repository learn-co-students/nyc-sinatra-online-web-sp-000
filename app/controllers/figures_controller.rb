class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    figure_name = params[:figure][:name]
    @figure = Figure.create(name: figure_name)
    if !params[:figure][:title_ids].empty?
      title_ids = params[:figure][:title_ids].join
      #binding.pry

      @figure.title_ids << title_ids
      @figure.save
    end
    #binding.pry
    if !params[:title][:name].empty?
      new_title = params[:title][:name]
      @title = Title.create(name: new_title)
      @figure.title_ids << @title.id
      @figure.save
    end

  end

end
