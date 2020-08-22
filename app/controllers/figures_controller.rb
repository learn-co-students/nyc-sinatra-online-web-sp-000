class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end
  get '/figures/new' do
    @figures = Figure.all
    @landmarks = Landmark.all
    @titles = Title.all 
    erb :'figures/new'
  end

  post "/figures" do
    if  params[:title][:name].empty? && params[:landmark][:name].empty?
        @figure = Figure.create(params[:figure])
    elsif !params[:title][:name].empty? && params[:landmark][:name].empty?
        title = Title.create(name: params[:title][:name])
        @figure = Figure.create(name: params[:figure][:name])
        @figure.titles << title
     elsif !params[:landmark][:name].empty? && params[:title][:name].empty?
        landmark = Landmark.create(name: params[:landmark][:name])
        @figure = Figure.create(name: params[:figure][:name])
        @figure.landmarks << landmark
     elsif !params[:landmark][:name].empty? && !params[:landmark][:name].empty?
       title = Title.create(name: params[:title][:name])
       @figure = Figure.create(name: params[:figure][:name])
       @figure.titles << title 
       landmark = Landmark.create(name: params[:landmark][:name])
       @figure = Figure.create(name: params[:figure][:name])
       @figure.landmarks << landmark    
    end
    redirect "/figures/#{@figure.id}"
  end

   get "/figures/:id/edit" do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find_by(id: params[:id] )
    erb :"figures/edit"

   end
  patch "/figures/:id" do
    @figure = Figure.find_by(id: params[:id])
    @figure.name = params[:figure][:name]
    @figure.save
    @landmark = Landmark.find_by(name: params[:new_landmark] )
    if @landmark 
      @figure.landmarks << @landmark
    else
      @figure.landmarks << Landmark.create(name: params[:new_landmark])
    end
  #  @landmarks = Landmarks.find_by(name: params[:new_landmark] )
    #  p @figure.landmarks
      @figure.landmarks << @landmark
     redirect "/figures/#{@figure.id}"
  end


  get "/figures/:id" do  
    @figure = Figure.find_by(id:params[:id] )
     erb :"figures/show"
  end
  
    


end
