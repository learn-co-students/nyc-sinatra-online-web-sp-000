require 'pry'
class FiguresController < ApplicationController

    get '/figures' do
        @figures = Figure.all
        erb :"/figures/index"
    end 

    post '/figures' do 
        @landmark = params[:landmark]
        @title = params[:title]
        @landmark_ids = params[:landmark][:landmark_ids]
        @title_ids = params[:figure][:title_ids]
        @figure = Figure.create(params[:figure])

        if !@title[:name].empty?
            t = Title.create(:name => @title[:name])
            @figure.titles << t
        end
        if @title_ids
            @title_ids.each do |id|
              t = Title.find(id)
              @figure.titles << t
            end
        end
        if !@landmark[:name].empty?
            l = Landmark.create(:name => @landmark[:name])
            @figure.landmarks << l
        end
        if @landmark_ids
            @landmark_ids.each do |id|
              l = Landmark.find(id)
              @figure.landmarks << l
            end
        end
        @figure.save
        redirect to "/figures/#{@figure.id}"
    end 

    get '/figures/new' do 
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'figures/new'
    end 

    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :edit
    end 

    patch '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.landmark = params[:figure][:landmark]
        @figure.title = params[:figure][:title]
        @figure.save
        redirect to "/figures/#{@figure.id}"
    end 

    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end 

end
