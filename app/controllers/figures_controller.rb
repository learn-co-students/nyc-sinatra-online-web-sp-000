class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @new_figure = Figure.create(params[:figure])
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
    @new_figure.save
    redirect "/figures/#{@new_figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end


  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    @new_title_form = params[:title][:name]
    if @new_title_form != ""
      @new_title = Title.create(name: params[:title][:name])
      @figure.titles << @new_title
    end
    @new_landmark_form = params[:landmark][:name]
    if @new_landmark_form != ""
      @new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
      @figure.landmarks << @new_landmark
    end 
    @figure.save  
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

end
