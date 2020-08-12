class FiguresController < ApplicationController
  
  def update(figure, params)
    figure.name = params[:figure][:name]
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|id| figure.titles << Title.find(id.to_i)}
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|id| figure.landmarks << Landmark.find(id.to_i)}
    end
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    figure.save
  end

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
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  post '/figures/new' do
    figure = Figure.new
    update(figure, params)
    redirect to "/figures/#{figure.id}"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    update(figure, params)
    redirect to "figures/#{figure.id}"
  end

end
