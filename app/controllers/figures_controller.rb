class FiguresController < ApplicationController
  # add controller methods

  #This is where the magic happens
  #When a user creates or edits a figure, they should also be able to select or create a new landmark and/or title to associate to that figure.
  #The form for a new figure and the form to edit a figure should allow the user to select from existing landmarks and title and create new landmarks and titles to associate to the figure.
  #New titles will only get created in the context of creating or editing a figure.

  get '/figures' do
    erb :'figures/index'
  end
end
