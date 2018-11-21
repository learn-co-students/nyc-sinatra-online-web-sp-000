class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    erb :'/landmarks/new'
  end

end
