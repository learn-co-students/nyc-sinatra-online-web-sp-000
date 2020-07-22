class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    #finish this
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
      end
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
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
      @title_ids.each do |id|
        t = Title.find(id)
        @figure.titles << t
      end
    end
    if !@title[:name].empty?
      t = Title.create(:name => @title[:name])
      @figure.titles << t
    end
    if @landmark_ids
      @figure.landmarks.clear
      @landmark_ids.each do |id|
        l = Landmark.find(id)
        @figure.landmarks << l
      end
    end
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end
end
