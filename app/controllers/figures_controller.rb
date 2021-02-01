class FiguresController < ApplicationController

  # get "/figures" do 
  #   @figures = Figure.all
  #   erb :'figures/index'
  # end
  
  get "/figures/new" do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post "/figures/new" do
    #binding.pry
  end

end
