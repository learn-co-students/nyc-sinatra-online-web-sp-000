class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @figure.landmarks << Landmark.create(params[:landmark]) unless  params[:landmark][:name].empty?
    @figure.titles << Title.create( params[:title]) unless  params[:title][:name].empty?

    @figure.save
    redirect to "/figures/#{@figure.id}"

  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) unless  params[:landmark][:name].empty?
    @figure.titles << Title.create( params[:title]) unless  params[:title][:name].empty?

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end