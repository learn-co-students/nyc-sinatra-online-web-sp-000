class FiguresController < ApplicationController
  set :views, proc { File.join(root, '../views/') }

  get '/figures' do 
    @figure = Figure.all
    erb :'figures/index'
  end 


  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
    if params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    if params["landmark"]["name"] && !params["landmark"]["year"] != ""
      @landmark = Landmark.create(params[:landmark])
      @landmark.name = params["landmark"]["name"]
      @landmark.year_completed = params["landmark"]["year"]
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end





end