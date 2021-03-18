class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do 
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do 
    figure = Figure.create(:name => params[:figure][:name])
    title = params[:title][:name]
    cb_titles = params[:figure][:title_ids]
    landmark = params[:landmark][:name]
    cb_landmarks = params[:figure][:landmark_ids]
 
    if title != ""
      figure.titles << Title.create(:name => title)
    end
    if landmark != ""
      figure.landmarks << Landmark.create(:name => landmark)
    end
    if !cb_titles.nil?
      cb_titles.each do |t|
        figure.titles << Title.find(t)
      end
    end
    if !cb_landmarks.nil?
      cb_landmarks.each do |l|
        figure.landmarks << Landmark.find(l)
      end
    end
    figure.save
    redirect "figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do 
    figure = Figure.find(params[:id])
    figure.update(:name => params[:figure][:name])
    title = params[:title][:name]
    cb_titles = params[:figure][:title_ids]
    landmark = params[:landmark][:name]
    cb_landmarks = params[:figure][:landmark_ids]

    if title != ""
      figure.titles << Title.create(:name => title)
    end
    if landmark != ""
      figure.landmarks << Landmark.create(:name => landmark)
    end
    if !cb_titles.nil?
    figure.update(:title_ids => cb_titles)
    end
    if !cb_landmarks.nil? 
    figure.update(:landmark_ids => cb_landmarks)
    end
    figure.save
    redirect "figures/#{figure.id}"
  end
  
end
