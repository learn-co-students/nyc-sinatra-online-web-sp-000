class FiguresController < ApplicationController
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    if params[:new_title] != ""
      figure.titles << Title.create(name:params[:new_title])
    end
    if params[:new_landmark] != ""
      figure.landmarks << Landmark.create(name:params[:new_landmark])
    end
    figure.save

    redirect :"/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if params[:new_title] != ""
      figure.titles << Title.create(name:params[:new_title])
    end
    if params[:new_landmark] != ""
      figure.landmarks << Landmark.create(name:params[:new_landmark])
    end
    figure.save

    redirect :"/figures/#{figure.id}"
  end
end
