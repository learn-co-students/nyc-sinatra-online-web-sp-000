class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end 

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id)
      end 
    end

    if params[:title][:name]
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end 
  
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
  end 

  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :'/figures/new'
  end 

  get "/figures/:id/edit" do 
    @figure = Figure.find(params[:id])
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id)
      end 
    end

    if params[:title][:name]
      @figure.titles << Title.create(name: params[:title][:name])
    end
     
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end 
  
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    
    redirect to "/figures/#{figure.id}"
  end
end
