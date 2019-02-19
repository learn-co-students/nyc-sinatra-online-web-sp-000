class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
         @figure.titles << Title.create(name: params[:title][:name])
      else
        @title_id = Title.find_by(params[:figure][:title_ids])
        @figure.titles << @title_id
    end

    if !params[:landmark].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      else
        @landmark_id = Landmark.find_by(params[:figure][:landmark_ids])
        @figure.landmarks << @landmark_id
    end

    redirect "/figures/#{@figure.id}"
  end


  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"

  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end


  patch "/figures/:id" do

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
         @figure.titles << Title.update(name: params[:title][:name])
      else
        @title_id = Title.find_by(params[:figure][:title_ids])
        @figure.titles << @title_id
    end

    if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.update(name: params[:landmark][:name])
    end

    if !params[:landmark][:year_completed].empty?
        @figure.landmarks << Landmark.update(name: params[:landmark][:year_completed])
      else
        @landmark_id = Landmark.find_by(params[:figure][:landmark_ids])
        @figure.landmarks << @landmark_id
    end

    redirect "/figures/#{@figure.id}"
  end


end
