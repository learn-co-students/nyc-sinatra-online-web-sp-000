class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @new_figure = Figure.create(name: params[:figure][:name])
    @new_title_form = params[:title][:name]
    if @new_title_form != ""
      @new_title = Title.create(name: params[:title][:name])
      @new_figure.titles << @new_title
    end
    @new_landmark_form = params[:landmark][:name]
    if @new_landmark_form != ""
      @new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
      @new_figure.landmarks << @new_landmark
    end
    if params[:figure][:title_ids] != []
      params[:figure][:title_ids].each do |id|
        @new_figure.titles << Title.find(id)
      end
    end
    binding.pry
    if params[:figure][:landmark_ids] != []
      params[:figure][:landmark_ids].each do |id|
        @new_figure.landmarks << Landmark.find(id)
      end
    end
    @new_figure.save
    redirect "/figures/#{@new_figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

end
