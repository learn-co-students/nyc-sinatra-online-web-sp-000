class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    #binding.pry
    erb :'figures/index'
  end

  get '/figures/new' do
    
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end



  post '/figures' do
    
    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    

    binding.pry
    if params[:landmark][:name] == ""
      
      @figure.landmarks.push(Landmark.find(params[:figure][:landmark_ids]))
      
    else
      @figure.landmarks.push(Landmark.find_or_create_by(name: params[:landmark][:name]))
      
    end
    
    if params[:title][:name] == ""
      @figure.titles.push(Title.find(params[:figure][:title_ids]))
     
    else
      @figure.titles.push(Title.find_or_create_by(name: params[:title][:name]))
      
    end
    

    

    @figure.save
    
    redirect to "/figures/#{@figure.id}"
  end
end
