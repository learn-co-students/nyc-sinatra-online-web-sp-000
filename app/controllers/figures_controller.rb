class FiguresController < ApplicationController
  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    # create figure
    figure = Figure.create(name: params["figure"]["name"])

    # associate existing titles
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |title_id|
        FigureTitle.create({:title_id => title_id, :figure_id => figure.id})
      end
    end

    # add new title
    if !params["title"]["name"].empty?
      title_id = Title.create(name: params["title"]["name"]).id
      FigureTitle.create({:title_id => title_id, :figure_id => figure.id})
    end

    # associate existing landmarks
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |landmark_id|
        landmark = Landmark.find(landmark_id).update(figure_id: figure.id)
      end
    end

    # add new landmark
    if !params["landmark"]["name"].empty?
      Landmark.create({:name => params["landmark"]["name"], :figure_id => figure.id, :year_completed => params["landmark"]["year_completed"]})
    end

    redirect to "/figures/#{figure.id}"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params["figure"]["name"])

    # remove existing title associations
    FigureTitle.destroy_by(figure_id: figure.id)

    # associate existing titles
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |title_id|
        FigureTitle.create({:title_id => title_id, :figure_id => figure.id})
      end
    end

    # add new title
    if !params["title"]["name"].empty?
      title_id = Title.create(name: params["title"]["name"]).id
      FigureTitle.create({:title_id => title_id, :figure_id => figure.id})
    end

    # remove existing landmark associations
    Landmark.where(figure_id: figure.id).update_all(figure_id: "")

    # associate existing landmarks
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |landmark_id|
        landmark = Landmark.find(landmark_id).update(figure_id: figure.id)
      end
    end

    # add new landmark
    if !params["landmark"]["name"].empty?
      Landmark.create({:name => params["landmark"]["name"], :figure_id => figure.id, :year_completed => params["landmark"]["year_completed"]})
    end

    redirect to "/figures/#{figure.id}"
  end
end
