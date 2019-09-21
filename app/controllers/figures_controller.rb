class FiguresController < ApplicationController
# add controller methods

#This is where the magic happens
#When a user creates or edits a figure, they should also be able to select or
#create a new landmark and/or title to associate to that figure.
#The form for a new figure and the form to edit a figure should allow the user
#to select from existing landmarks and title and create new landmarks and titles
#to associate to the figure.
#New titles will only get created in the context of creating or editing a figure.
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(params[:name])
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'/figures/show'
  end


end
