class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    # Landmark Section------------------
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
      end
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids].each do |landmark_id|
          landmark = Landmark.find(landmark_id)
          landmark.figure = @figure
          landmark.save
          @figure.landmarks << landmark
        end
      end
    # End Landmark Section------------------

    # Title Section--------------------------
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    # End Title Section--------------------
    
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    
    # Landmark Section------------------
    @figure.landmarks.clear
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        landmark = Landmark.find(landmark_id)
        landmark.figure = @figure
        landmark.save
        @figure.landmarks << landmark
      end
    end
    # End Landmark Section------------------


    # Title Section--------------------------
    @figure.titles.clear
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end
    # End Title Section--------------------

   redirect "/figures/#{@figure.id}"
  end
end
