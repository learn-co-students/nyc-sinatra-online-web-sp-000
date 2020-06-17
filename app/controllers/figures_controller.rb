require 'pry'
class FiguresController < ApplicationController


    get '/figures/new' do 
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'figures/new'
    end 

    post '/figures' do 
        binding.pry
        @figure = Figure.create(params)
        redirect to "/figures/#{@figure.id}"
    end 

    get '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        erb :'/figures/show'
    end 

end
