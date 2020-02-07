class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.new(name = params[:figure][:name])
    figure.landmarks = params[:landmark][:name]
    if params[:landmark][:name].empty?
      new_landmark = Landmark.new(params[:landmark])
      new_landmark.save
      figure.landmarks
    end

    unless params[:titles][:name].empty?
      figure.titles << Titles.new(params[:title]).save
    end
    figure.save
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
   @figure = Figure.find(params[:id])
   erb :'figures/edit'
  end

   patch '/figures/:id' do
     @figure = Figure.find_by_id(params[:id])

   end


 end


end
