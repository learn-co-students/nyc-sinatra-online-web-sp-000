class FiguresController < ApplicationController

  get "/figures" do 
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get "/figures/new" do
    erb :'figures/new'
  end

  post "/figures" do
    # new figure and the form to edit a figure should allow the user to select from existing landmarks 
    # and title and create new landmarks and titles to associate to the figure.
    #binding.pry
    # @figure = Figure.create(params[:figure])
        
    # @figure.title_ids = params[:titles]

    # @figure.landmark_ids = params[:landmarks]

    # @figure.save   
    
    # # for creating a title from the "text" box, not the checkboxes, we would write something like:
    # # find a new title through the title[name] params (params[:title][:name]), and add it to the figure instance
    # # also add the "checked" figure[title_ids][] (params[:figure][:title_ids]) to the figure instance

    # redirect to "/figures/#{@figure.id}"
  end

  # get "/figures/:id" do
  #   @figure = Figure.find(params[:id])
  #   erb :'/figures/show'
  # end


end
