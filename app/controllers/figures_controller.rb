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
  
      if !params["figure"]["name"].empty?
        @figure = Figure.new(params[:figure])
      end

      if !params[:title][:name].empty?
        @title = Title.find_by(name: params[:title][:name])
       
        if !@title
          @title = Title.create(params[:title])
        end
        @figure.titles << @title
      end
     
      if !params[:landmark][:name].empty?
        @landmark = Landmark.find_by(name: params[:landmark][:name])
       
        if !@landmark
          @landmark = Landmark.create(name: params[:landmark][:name])
        end
           @figure.landmarks << @landmark
        
      end
      @figure.save
      
      redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
        if !params[:figure].keys.include?("landmark_ids")
          params[:figure]["landmark_ids"] =[]
        end
    
        @figure= Figure.find(params[:id])
        @figure.update(params["figure"])
    
        if !params["landmark"]["name"].empty?
          @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
        end
     
       
        redirect "figures/#{@figure.id}"
  end



end
