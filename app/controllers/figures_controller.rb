class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure]) #Creates our figure given the user's input.
    if !params[:title][:name].empty? #Run if the user has entered a new title. Else, run the selected title.
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty? #Run if the user has entered a new landmark. Else, run the selected landmark
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save


    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id]) #Finds the figure by id entered
    @figure.update(params["figure"]) #Updates the figure given the user parameters
    if !params[:title][:name].empty? #Run if the user has entered a new title. Else, run the selected title.
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty? #Run if the user has entered a new landmark. Else, run the selected landmark
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save


    redirect to "/figures/#{@figure.id}"
  end

end
