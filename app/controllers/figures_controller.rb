class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
      ####### bug fix
      if !params[:figure].keys.include?("landmark_ids")
        params[:figure]["landmark_ids"] = []
      end
        #######
           ####### bug fix
      if !params[:figure].keys.include?("title_ids")
        params[:figure]["title_ids"] = []
      end
        #######
   
  
    if !params[:landmark][:name].empty?
      @new_landmark = Landmark.create(params[:landmark])
      params[:figure][:landmark_ids] << @new_landmark.id
    end

    if !params[:title][:name].empty?
      @new_title = Title.create(params[:title])
      params[:figure][:title_ids] << @new_title.id
    end
    @figure = Figure.create(params[:figure])
    redirect to "/figures/#{@figure.id}"

  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    
       ####### bug fix
       if !params[:figure].keys.include?("landmark_ids")
        params[:figure]["landmark_ids"] = []
      end
        #######
           ####### bug fix
      if !params[:figure].keys.include?("title_ids")
        params[:figure]["title_ids"] = []
      end
        #######
   
  
    if !params[:landmark][:name].empty?
      @new_landmark = Landmark.create(params[:landmark])
      params[:figure][:landmark_ids] << @new_landmark.id
    end

    if !params[:title][:name].empty?
      @new_title = Title.create(params[:title])
      params[:figure][:title_ids] << @new_title.id
    end
    
    @figure = Figure.find(params[:id])
    
    @figure.update(params[:figure])
    redirect "/figures/#{@figure.id}"
  end

end
