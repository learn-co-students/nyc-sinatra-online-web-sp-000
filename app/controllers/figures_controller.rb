class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
  erb :'/figures/index'
  end

  get '/figures/new' do
# binding.pry
@titles = Title.all
@landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
  binding.pry
    @figure = Figure.create(name: params[:figure][:name])
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  # patch '/figures/:id'
  #
  # end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
end
