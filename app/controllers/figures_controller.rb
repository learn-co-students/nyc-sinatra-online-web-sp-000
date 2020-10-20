class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
  	@figures = Figure.all
  	erb :'figures/index'
  end

  get '/figures/new' do
  	@titles = Title.all
  	@landmarks = Landmark.all
  	erb :'/figures/new'
  end

  get '/figures/:id' do
  	@figure = Figure.find(params[:figure][:id])
  	erb :"/figures/show"
  end

  post '/figures' do
  	@figure = Figure.create(name: params[:figure][:name])

  	if !params[:title][:name].empty?
  		@figure.titles << Title.create(name: params[:title][:name])
  	else
  		@figure.titles << Title.find(params[:figure][:title_ids])
  	end

  	binding.pry

  	if !params[:landmark][:name].empty?
		@figure.landmarks << Landmark.create(name: params[:landmark][:name])
  	else
  		@figure.landmarks = Landmark.find(params[:figure][:landmark_ids])
  	end

  	@figure.save

  	erb :'/figures/show'
  end

end
