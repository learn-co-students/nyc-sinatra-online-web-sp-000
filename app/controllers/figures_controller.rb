class FiguresController < ApplicationController
  get '/figures/' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params(:slug))
    erb :'figures/show'
  end
end
