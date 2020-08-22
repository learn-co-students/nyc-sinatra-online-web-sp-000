class FiguresController < ApplicationController
  # add controller methods
  # allows you to list all figures (FAILED - 7)
  get "/figures" do
    erb :"figures/figures"
  end  

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
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/edit_figure"
  end

  post "/figures/:id/edit" do
    @figure = Figure.find_by(:id => params[:id])
    @figure.update(params[:figure])
    if params[:new_landmark] != ""
      @figure.landmarks << Landmark.find_or_create_by(:name => params[:new_landmark]) 
    end
    
    redirect to("/figures/#{@figure.id}")
  end
  
  get "/figures/:id" do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/figure"
  end
  
end
