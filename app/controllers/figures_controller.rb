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
    if !params["title"]["name"].empty?
         @figure.titles << Title.create(name: params["title"]["name"])
        end

    if !params["figure"]["landmark"].empty?
    @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
  end

  get '/figures/:id/edit' do

    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do

    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end



end
