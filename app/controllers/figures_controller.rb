class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        title = Title.find(id)
        figure.titles << title
      end
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        landmark = Landmark.find(id)
        figure.landmarks << landmark
      end
    end
    if params[:title]
      title = Title.create(name: params[:title][:name])
      figure.titles << title
    end
    if params[:landmark]
      landmark = Landmark.create(name: params[:landmark][:name])
      figure.landmarks << landmark
    end
    figure.save
    redirect to "/figures/#{figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get "/figures/:id/edit" do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch "/figures/:id" do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |id|
        title = Title.find(id)
        figure.titles << title
      end
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |id|
        landmark = Landmark.find(id)
        figure.landmarks << landmark
      end
    end
    if params[:title]
      title = Title.create(name: params[:title][:name])
      figure.titles << title
    end
    if params[:landmark]
      landmark = Landmark.create(name: params[:landmark][:name])
      figure.landmarks << landmark
    end
    figure.save
    redirect to "/figures/#{figure.id}"
  end
end
