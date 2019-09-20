class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @landmarks=Landmark.all
    @titles=Title.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure=Figure.create(params["figure"])
    @landmark=Landmark.create(params["landmark"])
    @figure.landmarks<<@landmark
    if !params[:title][:name].empty?
      title=Title.create(params[:title])
      @figure.titles<<title
    end
    @figure.save
      redirect to "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures=Figure.all
    erb :"/figures/index"
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @titles=Title.all
    @figure=Figure.find(params[:id])
    @landmarks=Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure=Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      title=Title.create(params[:title])
      @figure.titles<<title
    end

    if !params[:landmark][:name].empty?
      landmark=Landmark.create(params[:landmark])
      @figure.landmarks<<landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
