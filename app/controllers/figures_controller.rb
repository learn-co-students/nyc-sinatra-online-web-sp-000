class FiguresController < ApplicationController
  # add controller methods
  
  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end
  
  post "/figures/new" do
    @new_figure = Figure.create(name: params[:figure][:name],  landmark_ids: params[:figure][:landmark_ids], title_ids: params[:figure][:title_ids])
    @new_title = Title.create(name: params[:title][:name]) unless params[:title][:name] == ""
    @new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name] == ""
    
    # if !(params[:figure][:landmark_ids].empty?)
    #   params[:figure][:landmark_ids].each {|landmark_id| @new_figure.landmarks << Landmark.find_by_id(landmark_id)}
    # end
    
    # if !(params[:figure][:title_ids].empty?)
    #   params[:figure][:title_ids].each {|title_id| @new_figure.titles << Title.find_by_id(title_id)}
    # end
    
    # any reason why above code doesn't work? or only works for one then skips the rest?
    
    @new_figure.titles << @new_title if @new_title
    @new_figure.landmarks << @new_landmark if @new_landmark
    @new_figure.save
    redirect "/figures/#{@new_figure.id}"
  end
  
  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/show"
  end
  
  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end
  
  patch "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name], landmark_ids: params[:figure][:landmark_ids], title_ids: params[:figure][:title_ids])
    @new_title = Title.create(name: params[:title][:name]) unless params[:title][:name] == ""
    @new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name] == ""
    @figure.titles << @new_title if @new_title
    @figure.landmarks << @new_landmark if @new_landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
end
