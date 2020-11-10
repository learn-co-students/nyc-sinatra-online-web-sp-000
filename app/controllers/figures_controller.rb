class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.find_or_create_by(name: params[:figure][:name])
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    
    if title_ids
      title_ids.each do |t_id|
        t = Title.find(t_id)
        figure.titles << t
      end
    end
    
    if landmark_ids
      landmark_ids.each do |l_id|
        l = Landmark.find(l_id)
        figure.landmarks << l
      end
    end

    if !params[:title][:name].empty?
      title = Title.find_or_create_by(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      figure.landmarks << landmark
    end

    figure.save

    redirect "/figures/#{params[:id]}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]

    if title_ids
      figure.titles.clear
      title_ids.each do |t_id|
        t = Title.find(t_id)
        figure.titles << t
      end
    end

    if landmark_ids
      figure.landmarks.clear
      landmark_ids.each do |l_id|
        l = Landmark.find(l_id)
        figure.landmarks << l
      end
    end

    if !params[:title][:name].empty?
      title = Title.find_or_create_by(name: params[:title][:name])
      figure.titles << title
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      figure.landmarks << landmark
    end
    figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
