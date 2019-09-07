class FiguresController < ApplicationController
  get '/figures' do

  erb :'/figures/index'
  end

  get '/figures/new' do
# binding.pry
@titles = Title.all
@landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
raise params.inspect
    # binding.pry
  end
end
