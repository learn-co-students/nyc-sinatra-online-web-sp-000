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
  
  @figures = figure.create(name: params[:name])
  redirect to 'figures/#{@figure.id}'
end

get '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  erb :'figures/show'
end

get '/figures/:id/edit' do
  @figure = Figure.find_by_id(params[:id])
  erb 'figures/edit'
end

post '/figures/:id' do 
  @figure = Figure.find_by_id(params[:id])
  @figure = Figure.update(name: params[:name])
  redirect to '/figures/#{@figure.id}'
end

end

 