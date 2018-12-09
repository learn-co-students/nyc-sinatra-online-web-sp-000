class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        FigureTitle.create(figure: @figure, title: Title.find(title_id))
      end
    end

    if !params[:title][:name].empty?
      FigureTitle.create(figure: @figure, title: Title.create(name: params[:title][:name]))
    end
    
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        Landmark.find(landmark_id).update(figure: @figure)
      end
    end
    
    if !params[:landmark][:name].empty?
      Landmark.create(figure: @figure, year_completed: params[:landmark][:year], name: params[:landmark][:name])
    end
    
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        FigureTitle.find_or_create_by(figure: @figure, title: Title.find(title_id))
      end
    end

    if !params[:title][:name].empty?
      FigureTitle.create(figure: @figure, title: Title.create(name: params[:title][:name]))
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        Landmark.find(landmark_id).update(figure: @figure)
      end
    end

    if !params[:landmark][:name].empty?
      Landmark.create(figure: @figure, year_completed: params[:landmark][:year], name: params[:landmark][:name])
    end

    redirect "/figures/#{@figure.id}"
  end
end