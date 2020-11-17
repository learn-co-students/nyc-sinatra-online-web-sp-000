class FiguresController < ApplicationController
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    # binding.pry
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
    # if !params[:figure][:title_ids].empty?
    #   @figure.titles << params[:figure][:title_ids]
    # else
    #   @figure.title << params[:title][:name]
    # end

    # if !params[:figure][:landmark_ids].empty?
    #   @figure.landmarks << params[:figure][:landmark_ids]
    # else
    #   @figure.landmarks << params[:title][:landmark]
    # end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end


    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    @figure.update(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
      # binding.pry
    end

    @figure.save
    # binding.pry
    redirect "/figures/#{@figure.id}"
  end

end
