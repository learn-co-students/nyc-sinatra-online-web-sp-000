
class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(name: params["figure"]["name"])
    # checking whether any title boxes are ticked and then associating with figure
    if !params["figure"]["title_ids"].nil?
      @figure.title_ids = params["figure"]["title_ids"]
    end
    # checking if new title was created - if yes, associating with figure
    if !params["title"]["name"].empty?
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    # checking whether any landmark boxes are ticked and then associating with figure
    if !params["figure"]["landmark_ids"].nil?
      @figure.landmark_ids = params["figure"]["landmark_ids"]
    end
    # checking if new title was created - if yes, associating with figure
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
      @figure.landmarks << @landmark
    end
    redirect '/figures/index' #will list all figures
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # update the name, regardless changed
    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure"]["name"])
    # update the titles
    if params["figure"]["title_ids"].nil?
      @figure.title_ids = []
    else
      @figure.title_ids = params["figure"]["title_ids"]
    end
    # update the landmarks
    if params["figure"]["landmark_ids"].nil?
      @figure.landmark_ids = []
    else
      @figure.landmark_ids = params["figure"]["landmark_ids"]
    end
    #adds in any new landmarks
    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
      @figure.landmarks << @landmark
    end
    redirect to "/figures/#{@figure.id}"
  end

end
