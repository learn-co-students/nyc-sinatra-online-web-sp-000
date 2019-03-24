class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure=Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(:name => params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
      @figure = Figure.find(params[:id])
     
      erb :'/figures/show'
  
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    
    erb :'/figures/edit'
  end


  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id]) 
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
        @figure.titles << Title.create(:name => params[:title][:name])
    end
    if !params["landmark"]["name"].empty?
        @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
      end
    @figure.save
    redirect "figures/#{@figure.id}"
  end
end
