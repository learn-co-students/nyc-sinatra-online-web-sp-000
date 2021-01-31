class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

end
