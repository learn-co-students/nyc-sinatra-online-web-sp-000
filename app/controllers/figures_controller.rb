class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find_by(id: title_id)
      end
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find_by(id: landmark_id)
      end
    end

    redirect "/figures/#{@figure.id}"
  end

  patch '/figures' do
    @figure = Figure.find_by(id: params[:id])

    if !params[:figure][:name].empty?
      @figure.update(params[:figure])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        title = Title.find_by(id: title_id)
        if @figure.titles.include?(title)
          @figure.titles << title
        end
      end
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find_by(id: landmark_id)
      end
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])

    erb :'figures/edit'
  end
end
