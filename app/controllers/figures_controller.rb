class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    
    unless params['landmark']['name'].empty?
       figure.landmarks.find_or_create_by(params[:landmark])
     end

    unless params['title']['name'].empty?
      title = Title.find_or_create_by(params[:title])
      figure.figure_titles.create(title: title)
    end
    redirect "/figures/#{figure.id}" 
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do 
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    figure = Figure.find(params[:id])

    params['figure']['title_ids'] ? figure.update(params[:figure]) : figure.title_ids = []
    params['figure']['landmark_ids'] ? figure.update(params[:figure]) : figure.landmark_ids = []
    
    unless params['landmark']['name'].empty?
      figure.landmarks.find_or_create_by(params[:landmark])
    end

   unless params['title']['name'].empty?
     title = Title.find_or_create_by(params[:title])
     figure.figure_titles.create(title: title)
   end

    redirect "/figures/#{figure.id}"
  end
end
