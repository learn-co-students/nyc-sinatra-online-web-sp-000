class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index' 
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"], figure_id: @figure.id) 
      
    end

    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
end
