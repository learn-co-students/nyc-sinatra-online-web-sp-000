class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry #check params to make sure existing titles and landmarks are already in the :figure hash so we only need to shovel in the new ones
    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
        
    @figure.save

    redirect("/figures/#{@figure.id}")
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end


  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    # binding.pry
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
        # binding.pry
    @figure.save

    redirect("/figures/#{@figure.id}")
  end

end
