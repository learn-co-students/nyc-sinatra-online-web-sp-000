# Figure Controller
class FiguresController < ApplicationController
  # ---- GET ----
  get '/figures' do
    @figures = Figure.all
    erb :'figures/all'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    figure_id
    erb :'figures/show_one'
  end

  get '/figures/:id/edit' do
    figure_id
    erb :'figures/edit_one'
  end

  # ---- POST ----
  post '/figures' do
    @figure = Figure.create!(params['figure'])
    add_title_and_landmark
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  # ----- Patch ----
  patch '/figures/:id' do
    figure_id
    @figure.update!(params[:figure])
    add_title_and_landmark
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  helpers do
    def figure_id
      @figures = Figure.find(params[:id])
    end

    def add_title_and_landmark
      @figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    end
  end
end







