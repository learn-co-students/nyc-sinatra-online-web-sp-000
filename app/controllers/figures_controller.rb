class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.create(:name => params[:figure][:name])

    if !@title.empty?
      @figure.titles << Title.create(:name => @title[:name])
    end
    if @title_ids
      @title_ids.each { |title_id| @figure.titles << Title.find(title_id) }
    end
    if !@landmark.empty?
      @figure.landmarks << Landmark.create(:name => @landmark[:name])
    end
    if @landmark_ids
      @landmark_ids.each { |landmark_id| @figure.landmarks << Landmark.find(landmark_id) }
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    if !@title.empty?
      @figure.titles << Title.create(:name => @title[:name])
    end
    if @title_ids
      @figure.titles.clear
      @title_ids.each { |title_id| @figure.titles << Title.find(title_id) }
    end
    if !@landmark.empty?
      @figure.landmarks << Landmark.create(:name => @landmark[:name])
    end
    if @landmark_ids
      @figure.landmarks.clear
      @landmark_ids.each { |landmark_id| @figure.landmarks << Landmark.find(landmark_id) }
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
