class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id].to_i)

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id].to_i)

    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if !params[:figure][:title_ids]
      @figure.titles << Title.create(name: params[:title][:name])
    else
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id.to_i)
      end
    end
    
    if !params[:figure][:landmark_ids]
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed].to_i)
      @figure.landmarks << @landmark
    else
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id.to_i)
      end
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id].to_i)

    @figure.update(params[:figure])
    # @figure.title_ids = params
    # @figure.genre_ids = params[:genres]
    if params[:title]
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:landmark]
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end