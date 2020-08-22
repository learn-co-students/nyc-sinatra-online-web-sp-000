class FiguresController < ApplicationController
  # add controller methods
  # allows you to list all figures (FAILED - 7)
  get "/figures" do
    erb :"figures/figures"
  end  
  # allows you to view form to create a new figure (FAILED - 1)
  # allows you to create a new figure with a title (FAILED - 2)
  # allows you to create a new figure with a landmark (FAILED - 3)
  # allows you to create a new figure with a new title (FAILED - 4)
  # allows you to create a new figure with a new landmark (FAILED - 5)
  # creates checkboxes for all the landmarks and titles created on the Figures new page (FAILED - 6)
  get "/figures/new" do
    erb :"/figures/new"
  end

  post "/figures/new" do
    @figure = Figure.create(params[:figure])
    
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    
    if params[:title][:name] != ""
      @figure.titles << Title.create(:name => params[:title][:name])
    end
    @figure.save()
    redirect "/figures/#{@figure.id}"
    # @figure = Figure.find_or_create_by(:name => params[figure[:name]])
  end

  # allows you to view form to edit a single figure (FAILED - 9)
  # allows you to edit a single figure (FAILED - 10)
  get "/figures/:id/edit" do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/edit_figure"
  end

  post "/figures/:id/edit" do
    puts params
    binding.pry
    @figure = Figure.find_by(:id => params[:id])
    redirect "/figures/#{params[:id]}"
    # @figure = Figure.create(params[:figure])
    
    # if params[:landmark][:name] != ""
    #   @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    # end
    
    # if params[:title][:name] != ""
    #   @figure.titles << Title.create(:name => params[:title][:name])
    # end
    # @figure.save()
    # redirect "/figures/#{@figure.id}"
  end
  
  # allows you to see a single Figure (FAILED - 8)
  get "/figures/:id" do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/figure"
  end
  
end
