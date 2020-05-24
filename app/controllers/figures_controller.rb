class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
  	@landmarks = Landmark.all
  	@titles = Title.all
  	erb :'figures/new'
  end

  post '/figures' do
		@fig = Figure.create(params[:figure])
		@fig.landmarks.build(params[:landmark]) unless params[:landmark][:name].empty?
		@fig.titles.build(params[:title]) unless params[:title][:name].empty?
		@fig.save
		redirect "/figures/#{@fig.id}"
  end

  get '/figures/:id/edit' do
  	@fig = Figure.find(params[:id])
  	@titles = Title.all
  	erb :'figures/edit'
  end

  patch '/figures/:id' do
  	@fig = Figure.find(params[:id])
  	@fig.update(params[:figure])
  	@fig.landmarks.build(params[:landmark]) unless params[:landmark][:name].empty?

  	@fig.save
  	erb :'figures/show'
  end

  get '/figures' do
  	@figs = Figure.all
  	erb :'figures/index'
  end

  get '/figures/:id' do
  	@fig = Figure.find(params[:id])
  	erb :'figures/show'
  end
end
