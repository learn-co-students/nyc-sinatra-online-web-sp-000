class FiguresController < ApplicationController
  # add controller methods

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
    @figure = Figure.find(:id)
    erb :'figures/show'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure][:name])

    if params[:figure].has_key?(:title_ids)
      params[:figure][:title_ids].each do |title_id|
        figure.titles << Title.find(title_id)
      end
    end

    if params[:figure].has_key?(:landmark_ids)
      params[:figure][:landmark_ids].each do |landmark_id|
        figure.landmarks << Landmark.find(landmark_id)
      end
    end

    if !params[:title][:name].blank?
      figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:landmark][:name].blank?
      figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end

    redirect '/figures'
  end

end
