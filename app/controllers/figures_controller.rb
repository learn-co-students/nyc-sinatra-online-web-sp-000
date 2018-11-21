class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/landmarks/new'
  end

end
