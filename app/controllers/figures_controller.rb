class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all

  erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.all.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.all.find_by_id(params[:id])
    # binding.pry
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
      # binding.pry
    if params[:figure][:title_ids]
      @figures.titles.clear
      params[:figure][:title_ids].each do |id|
        title = Title.find_by_id(id)
        @figure.titles << title
      end
    end
    redirect "/figures/#{@figure.id}"
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])

    if !params[:title][:name].empty?
      title = Title.create(:name => params[:title][:name])
      @figure.titles << title
    end

    if params[:figure][:title_ids]
       params[:figure][:title_ids].each do |t|

       title = Title.find_by_id(t)
       @figure.titles << title
       end
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(:name => params[:landmark][:name])
      @figure.landmarks << landmark
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |l|
        # binding.pry
        landmark = Landmark.find_by_id(l)
        @figure.landmarks << landmark
      end
    end
    redirect "/figures/#{@figure.id}"
  end
end
