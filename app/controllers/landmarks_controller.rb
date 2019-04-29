class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
    end

    get '/landmarks/new' do
      erb :"landmarks/new"
    end

    post '/landmarks' do
      @landmark = Figure.create(params['figure'])
      unless params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      unless params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
    end
end
