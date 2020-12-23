class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure][:name])
    params[:figure][:title_ids].each {|id| figure.titles << Title.find(id)} if params[:figure][:title_ids]
    figure.titles << Title.create(name: params[:title][:name]) if params[:title][:name] != ''
    params[:figure][:landmark_ids].each {|id| figure.landmarks << Landmark.find(id)} if params[:figure][:landmark_ids]
    figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark]
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params[:figure][:name])
    params[:figure][:title_ids].each {|id| figure.titles << Title.find(id)} if params[:figure][:title_ids]
    figure.titles << params[:title][:name] if params[:title][:name] != ''
    figure.landmarks << params[:landmark][:name] if params[:landmark][:name] != ''
    params[:figure][:landmark_ids].each {|id| figure.landmarks << Landmark.find(id)} if params[:figure][:landmark_ids]
    figure.save
    redirect to "/figures/#{figure.id}"
  end
end
