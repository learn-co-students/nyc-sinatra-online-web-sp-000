class FiguresController < ApplicationController
  # add controller methods

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
    id = params[:id]
    @figure = Figure.find_by_id(id)
    #binding.pry
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :"figures/edit"
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
    #binding.pry

    #@figure.titles = []
    #@figure.landmarks = []

    ####titles
    new_title = params[:title][:name]
    title_selections = params[:figure][:title_ids] 

    if title_selections
      title_selections.each do |title|
        Title.find(title)
        @figure.titles << Title.find(title)
      end
    elsif new_title
      title = Title.create(:name => new_title)
      @figure.titles << title
    end
    #binding.pry
    #@figure.titles << @titles
    
    ####landmarks
    new_landmark = params[:landmark][:name]
    landmark_selections = params[:figure][:landmark_ids]
    if landmark_selections
      landmark_selections.each do |landmark|
        Landmark.find(landmark)
        @figure.landmarks << Landmark.find(landmark)
      end
    elsif new_landmark
      landmark = Landmark.create(:name => params[:landmark][:name])
      @figure.landmarks << landmark
    end
    #@figure.landmarks = @landmarks

    @figure.save
    #successfully created 
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    
    new_title = params[:figure][:title]
    new_landmark = params[:figure][:landmark]

    checked_titles = params[:figure][:title_ids]
    checked_landmarks = params[:figure][:landmark_ids]

    if new_title
      title = Title.create(:name => params[:figure][:title])
      @figure.titles << title
    elsif checked_titles
      checked_titles.each do |title|
        @figure.titles << Title.find(title)
      end
    end

    if new_landmark
      landmark = Landmark.create(:name => params[:figure][:landmark])
      @figure.landmarks << landmark
    elsif checked_landmarks
      checked_landmarks.each do |landmark|
        @figure.landmarks << Landmark.find(landmark)
      end
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
