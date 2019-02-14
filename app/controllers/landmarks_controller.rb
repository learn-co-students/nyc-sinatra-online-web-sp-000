class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post "/landmarks" do

   @landmark = Landmark.create(params[:landmark])

    if !params[:figure][:name].blank?
      @figure = Figure.create(name: params[:figure][:name])
      @figure.landmarks << @landmark
    end

    if !params[:figure][:figure_ids].nil?
      @figure = Figure.find(params[:figure][:figure_ids][0])
      @figure.landmarks << @landmark
    end

    if !params[:title][:title_ids].nil?
      params[:title][:title_ids].each do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end

    if !params[:title][:name].blank?
      title = Title.create(name: params[:title][:name])
      @figure.titles << title
    end

    redirect to "landmarks/#{@landmark.id}"

  end

  get "/landmarks/:landmark_id" do
    @landmark = Landmark.find(params[:landmark_id])
    erb :'landmarks/show'
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end


  get "/landmarks/:landmark_id/edit" do
    @landmark = Landmark.find(params[:landmark_id])
    @figure = Figure.find(@landmark.figure_id)
    erb :'landmarks/edit'
  end

  patch '/landmarks/:landmark_id' do
  @landmark = Landmark.find(params[:landmark_id])
  @landmark.update(params[:landmark])
   if !params[:figure][:name].blank?
     @figure = Figure.create(name: params[:figure][:name])
     @figure.landmarks << @landmark
   end

   if !params[:figure][:figure_ids].nil?
     @figure = Figure.find(params[:figure][:figure_ids][0])
     @figure.landmarks << @landmark
   end

   if !params[:title][:title_ids].nil?
     params[:title][:title_ids].each do |id|
       title = Title.find(id)
       @figure.titles << title
     end
   end

   if !params[:title][:name].blank?
     title = Title.create(name: params[:title][:name])
     @figure.titles << title
   end

   redirect to "landmarks/#{@landmark.id}"

  end

end
