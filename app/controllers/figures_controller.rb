class FiguresController < ApplicationController
  # add controller methods
  
  # allows you to view form to create a new figure (FAILED - 1)
  get "/figures/new" do
    erb :"/figures/new"
  end

  post "/figures/new" do
    @figure = Figure.find_or_create_by(:name => params[figure[:name]])
  end
end
# allows you to create a new figure with a title (FAILED - 2)
# allows you to create a new figure with a landmark (FAILED - 3)
# allows you to create a new figure with a new title (FAILED - 4)
# allows you to create a new figure with a new landmark (FAILED - 5)
# creates checkboxes for all the landmarks and titles created on the Figures new page (FAILED - 6)
# allows you to list all figures (FAILED - 7)
# allows you to see a single Figure (FAILED - 8)
# allows you to view form to edit a single figure (FAILED - 9)
# allows you to edit a single figure (FAILED - 10)
