class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])

    if params[:figure][:title_ids] != nil
      figure_titles = []
      figure_titles = params[:figure][:title_ids]
      figure_titles.each do |title_id|
        @figure.titles << Title.find_by_id(title_id)
      end
    end

    if !params[:title][:name].empty?
      new_title = Title.create(params[:title])
      @figure.titles << new_title
    end

    if params[:figure][:landmark_ids] != nil
      figure_landamrks = []
      figure_landmarks = params[:figure][:landmark_ids]
      figure_landmarks.each do |landmark_id|
        @figure.landmarks << Landmark.find_by_id(landmark_id)
      end
    end

    if !params[:landmark][:name].empty?
      if params[:landmark][:year].empty?
        new_landmark = Landmark.create(:name => params[:landmark][:name])
      else
        new_landmark = Landmark.create(params[:landmark])
      end
      @figure.landmarks << new_landmark
    end

    @figure.save
    redirect to("/figures/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @updated_figure = Figure.find_by_id(params[:id])
    
    if !params[:figure][:name].empty?
      @updated_figure.name = params[:figure][:name]
    end

    @updated_figure.landmarks = []

    if params[:figure][:landmark_ids] != nil
      figure_landmarks = params[:figure][:landmark_ids]
      figure_landmarks.each do |landmark|
        @updated_figure.landmarks << Landmark.find_by_id(landmark)
      end
    end

    if !params[:landmark][:name].empty?
      if params[:landmark][:year].empty?
        new_landmark = Landmark.create(:name => params[:landmark][:name])
      else
        new_landmark = Landmark.create(params[:landmark])
      end
      @updated_figure.landmarks << new_landmark
    end

    @updated_figure.titles = []

    if params[:figure][:title_ids] != nil
      figure_titles = params[:figure][:title_ids]
      figure_titles.each do |title|
        @updated_figure.titles << Title.find_by_id(title)
      end
    end

    if !params[:title][:name].empty?
      new_title = Title.create(params[:title])
      @updated_figure.titles << new_title
    end

    @updated_figure.save
    redirect to("figures/#{@updated_figure.id}")
  end

end
      