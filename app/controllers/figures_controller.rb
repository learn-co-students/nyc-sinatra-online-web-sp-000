class FiguresController < ApplicationController
  
  get '/figures' do
    @figure = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @figure = Figure.all
    @title = Title.all
    @landmark = Landmark.all
  erb :'/figures/new'
  end

  post '/figures' do
      @figure = params[:figure][:name]
      # binding.pry
      figure = Figure.create(:name => @figure)
      figure.save
      landmark = Landmark.first
      landmark.figure = figure
      landmark.save
      if (!params[:landmark][:name] != "")
      landmark = Landmark.create(:name => params[:landmark][:name])
      end
        figure.landmarks << landmark
      title = Title.create(:name => params[:title][:name])
      title.figures << figure
      title.save
      # binding.pry
      figure.titles << Title.first
      # figure_title = FigureTitle.create(:figure_id => figure.id, :title_id => title.id)
      # figure_title.save
      
      redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.all
    
    erb :'/figures/show'
  end

  get "/figures/:id/edit" do
    id = params[:id]
    @figure = Figure.find(id)
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    figure = params[:figure][:name]
    @landmark = Landmark.create(name: params[:landmark][:name])

    @figure = Figure.find(params[:figure][:id])
    @figure.name = figure
    @figure.landmarks << @landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
