class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new'do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params)

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do

    erb :'figures/show'
  end

  get '/figures/:id/edit' do

    erb '/figures/***/edit'
  end


end
