class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do 
    erb :'/figures/new'
  end

  post '/figures' do 
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]
    @figure = Figure.create(name: params[:figure][:name])

    if !@title[:name].empty?
      t = Title.create(name: @title[:name])
      @figure.titles << t
    end
    if @title_ids
      @title_ids.each do |id|
        t = Title.find_by_id(id)
        @figure.titles << t
      end
    end
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
    end
    if @landmark_ids
      @landmark_ids.each do |id|
        l = Landmark.find_by_id(id)
        @figure.landmarks << l
      end
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
