class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all 
    erb :'/figures/index'
  end

  get '/figures/id' do
    @figures = Figure.find_by_id(params[:id])
    erb :'figures/root'
  end
end
