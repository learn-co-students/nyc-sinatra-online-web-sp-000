class FiguresController < ApplicationController
  # create routes ###############################
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all    
    erb :"/figures/new"
  end

  post '/figures' do    
    figure = Figure.create(params[:figure])

    # add newly created landmark (if given)
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(params[:landmark])
    end

    # add existing landmarks (if given)
    if existing_landmarks = params[:figure][:landmark_ids]
      existing_landmarks.each { |lm| figure.landmarks << lm.id }
    end

    # add newly created title (if given)
    if !params[:title][:name].empty?
      figure.titles << Title.new(params[:title])
    end

    # add existing titles (if given)
    if existing_titles = params[:figure][:title_ids]
      existing_titles.each { |t| figure.titles << t.id }
    end

    figure.save

    redirect "/figures/#{figure.id}"
  end

  # read routes #################################
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/:id' do    
    @figure = Figure.find(params[:id])    
    erb :"/figures/show"
  end

  # update routes ###############################
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all

    # @landmarks = @figure.landmarks.all
    # @titles = @figure.titles.all

    erb :"/figures/edit"
  end

  patch '/figures/:id' do    
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    # add newly created landmark (if given)
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(params[:landmark])
    end

    # add existing landmarks (if given)
    # if existing_landmarks = params[:figure][:landmark_ids]
    #   existing_landmarks.each { |lm| figure.landmarks << lm.id }
    # end

    # add newly created title (if given)
    if !params[:title][:name].empty?
      figure.titles << Title.new(params[:title])
    end

    # add existing titles (if given)
    # if existing_titles = params[:figure][:title_ids]
    #   existing_titles.each { |t| figure.titles << t.id }
    # end

    figure.save
    
    redirect "/figures/#{figure.id}"
  end


  # delete routes ###############################
end
