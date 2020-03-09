class FiguresController < ApplicationController
  # add controller methods
  get "/figures/new" do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|title_id|
        @figure.titles << Title.find(title_id)
      }
    end

    if params[:title][:name]
      @figure.titles << Title.create(:name => params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      }
    end

    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show' 
  end

end
