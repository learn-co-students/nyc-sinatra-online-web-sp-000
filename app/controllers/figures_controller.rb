class FiguresController < ApplicationController
  # add controller methods

  get "/figures" do
    @figures = Figure.all
    erb:"figures/index"
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb:"figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    @landmarks =@figure.landmarks
    @titles =@figure.titles
    erb:"figures/show"
  end

  post "/figures" do

    @figure = Figure.create(params[:figure])

    @title_name = params[:title][:name]
    @landmark_name = params[:landmark][:name]

    if !Title.find_by(name: @title_name)
      @title = Title.create(name: @title_name)
      @figure.titles << @title
    end

    if !Landmark.find_by(name: @t_name)
      @landmark = Landmark.create(name: @landmark_name)
      @figure.landmarks << @landmark
    end
  
  end

  get "/figures/:id/edit" do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
 
    erb:"/figures/edit"
  end

  patch "/figures/:id" do

    if !params[:figure].keys.include?("landmark_ids")
        params[:figure]["landmark_ids"] = []
    end

    if !params[:figure].keys.include?("title_ids")
      params[:figure]["title_ids"] = []
  end

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    # @figure = Figure.update(name:params[:figures][:name],titles: params[:figures][:title_ids], landmarks: params[:figures][:landmark_ids])
    @title_name = params[:title][:name]
    @landmark_name = params[:landmark][:name]

    if !Title.find_by(name: @title_name)
      @title = Title.create(name: @title_name)
      @figure.titles << @title
    end
    if !Landmark.find_by(name: @t_name)
      @landmark = Landmark.create(name: @landmark_name)
      @figure.landmarks << @landmark
    end
    
    redirect to "/figures/#{@figure.id}"
  end

end
