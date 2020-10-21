class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
  	@figures = Figure.all
  	erb :'figures/index'
  end

  get '/figures/new' do
  	@titles = Title.all
  	@landmarks = Landmark.all
  	erb :'/figures/new'
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
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    @figure.save
    redirect to :"figures/#{@figure.id}"
  end


  post '/figures' do
	  @figure = Figure.create(params['figure'])

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end 
end
end