class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index' 
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"], figure_id: @figure.id) 
      
    end

    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do 
    figure = Figure.find(params[:id])


    if params[:titles]
      params[:titles].each do |title|
      figure_titles << FigureTitle.create(figure_id: figure.id, title_id: title)
      end
    end
    
    if params[:landmarks]
      params[:landmarks].each do |landmark|
      figure.landmarks << landmark.find(landmark.id)
      end
    end

    # update figure
    figure.update(name: params[:figure][:name])
    figure.save
    
    if !params["title"]["name"].empty?
      figure.titles << Title.create(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"], figure_id: @figure.id) 
    end

    redirect to "figures/#{figure.id}"
  end
end
