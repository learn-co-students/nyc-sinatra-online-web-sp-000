class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all # need this bad boy for the erb, listing out all
    # of the titles from figures.
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'/figures/new'
        # binding.pry
  end

  post '/figures' do
      @figure = Figure.create(params["figure"])
      landmark_params = params["landmark"]

      if !params["title"]["name"].empty?
        title = Title.create(params["title"])
        @figure.titles << title
      end

      if !landmark_params.empty?
          landmark = Landmark.create(landmark_params)
          @figure.landmarks << landmark
      end
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find_by(params["id"])
      erb :'figures/show'
    end

    get '/figures' do
      @figures = Figure.all
      erb :'figures/all'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find_by(params["id"])

      erb :'figures/edit'
    end

    patch '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.name = params["figure"]["name"]

    @figure.landmarks.each do |landmark|
      if landmark.figure_id == params["id"].to_i
        old_landmark = Landmark.find_by(params["id"])
        old_landmark.name = params["landmark"]["name"]
        old_landmark.save
        end
      end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
