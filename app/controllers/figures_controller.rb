class FiguresController < ApplicationController
  
  get '/figures' do
    erb :'figures/index'
  end
  
  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    if params[:landmark][:name] != ""
      @new_landmark = Landmark.create(params[:landmark])
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] << @new_landmark.id
      else
        params[:figure][:landmark_ids] = [@new_landmark.id]
      end
    end
    if params[:title][:name] != ""
      @new_title = Title.create(params[:title])
      if params[:figure][:title_ids]
        params[:figure][:title_ids] << @new_title.id
      else
        params[:figure][:title_ids] = [@new_title.id]
      end
    end
    @figure = Figure.create(params[:figure])
    redirect "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    if params[:landmark][:name] != ""
      @new_landmark = Landmark.create(params[:landmark])
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] << @new_landmark.id
      else
        params[:figure][:landmark_ids] = [@new_landmark.id]
      end
    end
    if params[:title][:name] != ""
      @new_title = Title.create(params[:title])
      if params[:figure][:title_ids]
        params[:figure][:title_ids] << @new_title.id
      else
        params[:figure][:title_ids] = [@new_title.id]
      end
    end
    Figure.find(params[:id]).update(params[:figure])
    redirect "/figures/#{params[:id]}"
  end
  
end
