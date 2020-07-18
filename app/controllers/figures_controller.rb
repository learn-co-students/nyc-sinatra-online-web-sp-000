class FiguresController < ApplicationController

  #see all figures
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  #create new figure
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      # @figure.update(title: Title.create(params[:title]))
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      # @figure.update(landmark: Landmark.create(params[:landmark]))
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect "figures/#{@figure.id}"
  end

  #show a single figure
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  #edit a figure
  get '/figures/:id/edit' do
  @figure = Figure.find(params[:id])
  @titles = Title.all
  @landmarks = Landmark.all
  erb :'/figures/edit'
end

patch '/figures/:id' do
  # binding.pry
  @figure = Figure.find(params[:id])
  @figure.update(params[:figure])

  if !params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
  end

  if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
  end

  redirect "/figures/#{@figure.id}"
end

end
