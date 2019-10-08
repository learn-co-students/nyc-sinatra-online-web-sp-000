class FiguresController < ApplicationController
  
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    binding.pry
    #make new figure
    #associate titles and landmarks to figure
  end
  
  get '/figures/:id' do
    #check tested params which may not be 'id'
    #find by 'id' or something else
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    # find by...
    erb :'/figures/edit'
  end

  patch 'figures/:id' do
    #edit and reconstruct new figure
    redirect :'/figures/:id'
  end

end
