class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  post'/figures' do

    if params[:figure]["title_ids"].nil?
      params[:figure]["title_ids"] = []
    end

    if params[:figure]["landmark_ids"].nil?
      params[:figure]["landmark_ids"] = []
    end

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      params[:figure]["title_ids"] << title.id
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      params[:figure]["landmark_ids"] << landmark.id
    end

    @figure = Figure.create(params[:figure])

    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    if params[:figure]["title_ids"].nil?
      params[:figure]["title_ids"] = []
    end

    if params[:figure]["landmark_ids"].nil?
      params[:figure]["landmark_ids"] = []
    end

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      params[:figure]["title_ids"] << title.id
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      params[:figure]["landmark_ids"] << landmark.id
    end

    @figure.update(params[:figure])

    redirect to "/figures/#{@figure.id}"
  end
end
