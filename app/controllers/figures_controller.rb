class FiguresController < ApplicationController
  # add controller methods
  def index
    @figures = Figure.all 
  end 
end
