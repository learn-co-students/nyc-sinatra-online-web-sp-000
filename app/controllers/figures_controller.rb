require 'pry'
class FiguresController < ApplicationController


  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

# @genres = Genre.all
  get '/figures/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.create(:name => params[:figure][:name])
      if !@title[:name].empty?
         t = Title.create(:name => @title[:name])
         @figure.titles << t
      end

      if @title_ids
        @title_ids.each do |title|
        t = Title.find(title)
        @figure.titles << t
       end
     end

      if !@landmark[:name].empty?
        l = Landmark.create(:name => @landmark[:name])
        @figure.landmarks << l
      end

      if @landmark_ids
        @landmark_ids.each do |lm|
        l = Landmark.find(lm)
        @figure.landmark << l
        end
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

end
