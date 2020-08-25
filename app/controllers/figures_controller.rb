class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    
    erb :'figures/index'
  end
  
  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    if !!params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    if !!params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end
    if params["landmark"]["name"] != ""
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if params["title"]["name"] != ""
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @figure.save
    
    redirect "/figures/#{@figure.id}"
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
    @figure = Figure.find(params[:id])
    if params["figure"]["name"] != ""
      @figure.name = params["figure"]["name"]
    end
    @figure.titles.clear
    if !!params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    @figure.landmarks.clear
    if !!params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end
    if params["landmark"]["name"] != ""
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if params["title"]["name"] != ""
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @figure.save
    
    redirect "/figures/#{params[:id]}"
  end
end
