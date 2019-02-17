class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    binding.pry
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
         @figure.titles << Title.create(name: params[:title][:name])
      else
        @titles = Title.find_by(params[:figure][:title_ids])
        @figure.titles << @titles
        end

    if !params[:landmark].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect "figures/#{@figure.id}"
  end


  get '/figures/:id/edit' do

    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do

    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end



end
