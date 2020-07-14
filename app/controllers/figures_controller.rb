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

  post '/figures' do
    
    @figure = Figure.create(name: params[:figure][:name])

    #binding.pry

    if params[:figure][:title_ids] != nil

      @figure.titles << Title.find(params[:figure][:title_ids])

    end

    

    if !params[:title][:name].empty?

      @figure.titles << Title.create(name: params[:title][:name])
    
    end


    if params[:figure][:landmark_ids] != nil

      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids])

    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    
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
    @figure.update(name: params[:figure][:name])

    if params[:title][:name] != ""
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
      
    else
      
      @figure.titles << Title.find(params[:figure][:title_ids].first)
    end

    if params[:landmark][:name] != ""
      
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
      
    else

      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids].first)
      
    end

    
    
    @figure.save
    
    redirect to "/figures/#{@figure.id}"
  end

end
