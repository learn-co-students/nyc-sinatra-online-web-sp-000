class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all

  erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do

    @landmark = params[:landmark]

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
    
  end
end
