class FiguresController < ApplicationController
  
  get "/figures" do
    @figures = Figure.all
    erb :'figures/index'
  end

  get "/figures/new" do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end

    redirect "/figures/#{@figure.id}"
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
    
    @figure = Figure.find(params[:id])

    if !params[:figure][:name].empty?
      @figure.name = params[:figure][:name]
      @figure.save
    end

    if params[:figure].keys.include?("title_ids")
      @figure.titles.clear
      params[:figure][:title_ids].each {|title_id|
        @figure.titles << Title.find(title_id)
      }
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:title][:name])
    end

    if params[:figure].keys.include?("landmark_ids")
      @figure.landmarks.clear
      params[:figure][:landmark_ids].each {|landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      }
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end

    redirect "/figures/#{@figure.id}"

  end
end
