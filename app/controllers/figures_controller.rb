class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.create(:name => params[:figure][:name])

    if !@title[:name].empty?
      new_title = Title.create(:name => @title[:name])
      @figure.titles << new_title
    end

    if @title_ids
      @title_ids.each do |t_id|
        find_title = Title.find(t_id)
        @figure.titles << find_title
      end
    end

    if !@landmark[:name].empty?
      new_landmark = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << new_landmark
    end

    if @landmark_ids
      @landmark_ids.each do |l_id|
        find_landmark = Landmark.find(l_id)
        @figure.landmarks << find_landmark
      end
    end
    @figure.save
    redirect to "/figures/#{figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id/edit' do
  @figure = Figure.find(params[:id])
  @landmarks = Landmark.all
  @titles = Title.all
  erb :"/figures/edit"
end

patch '/figures/:id' do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if @title_ids
      @figure.titles.clear
      @title_ids.each do |t_id|
        title = Title.find(t_id)
        @figure.titles << title
      end
    end
    if !@title[:name].empty?
      title = Title.create(:name => @title[:name])
      @figure.titles << title
    end
    if @landmark_ids
      @figure.landmarks.clear
      @landmark_ids.each do |l_id|
        landmark = Landmark.find(l_id)
        @figure.landmarks << landmark
      end
    end
    if !@landmark[:name].empty?
      landmark = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
end
