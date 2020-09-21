class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all 
    erb :"figures/index" 
  end 
  
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all 
    erb :"figures/new"
  end 

  post '/figures' do 
    # binding.pry
    @figure = Figure.create(params[:figure])
    @title = Title.create(name: params[:title][:name])
    @landmark = Landmark.create(name: params[:title][:name])
    @figure.titles << @title
    @figure.landmarks << @landmark
  end 

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end 

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end 

  patch '/figures/:id' do 
    puts params 
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    # binding.pry
    # params[:song][:landmark_ids][] = @figure.landmark_ids.map{|l| l.to_s}
    if !params["landmark"]["name"].empty? 
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      landmark.figure_id = @figure.id
      # params[:figure][:landmark_ids] = "#{landmark.id}"
    else 
      params[:figure][:landmark_ids] = @figure.landmark_ids
    end 
    @figure.update(params[:figure])
    # @figure.name = params[:figure][:name]
    # @figure.landmarks << landmark
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end 

end
