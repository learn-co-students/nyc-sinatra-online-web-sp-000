class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    new_figure = Figure.create(name: params[:figure][:name])
    if params[:figure].has_key?(:title_ids)
      params[:figure][:title_ids].each do |id|
        existing_title = Title.find(id)
        new_figure.titles << existing_title
      end
    elsif !params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      new_figure.titles << new_title
    end
    if params[:figure].has_key?(:landmark_ids)
      params[:figure][:landmark_ids].each do |id|
        existing_landmark = Landmark.find(id)
        new_figure.landmarks << existing_landmark
      end
    elsif !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name])
      new_figure.landmarks << new_landmark
    end
    redirect "/figures/#{new_figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    edited_figure = Figure.find(params[:id])
    if !params[:figure][:name].empty?
      edited_figure.update(name: params[:figure][:name])
      if !params[:new_landmark].empty?
        new_landmark = Landmark.create(name: params[:new_landmark])
        edited_figure.landmarks << new_landmark
      end
    end
    edited_figure.save
    redirect "/figures/#{edited_figure.id}"
  end

end
