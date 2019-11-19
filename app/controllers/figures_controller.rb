class FiguresController < ApplicationController
  
  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
  erb :'application/figures/new'
  end

  post '/figures' do
    raise params.inspect
  end



end
