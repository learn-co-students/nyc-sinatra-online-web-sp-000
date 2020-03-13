class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all

    erb :'figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
    @figure.save

    redirect to "/figures/#{@figure.slug}"
  end

  get '/figures/:slug' do
    # binding.pry
    @figure = Figure.find_by_slug(params[:slug])
    
    erb :'figures/show'
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])

    erb :'figures/edit'
  end

  patch '/figures/:slug' do
    binding.pry
    @figure = Figure.find_by_slug(params[:slug])
    @figure.update(params[:figure])
      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end
    @figure.save

    
    redirect to "/figures/#{@figure.slug}"
  end

end
