class LandmarksController < ApplicationController
  # allows you to view form to create a new landmark
  # allows you to create a new landmark
  # allows you to list all landmarks
  # allows you to see a single landmark
  # allows you to view the form to edit a single landmark
  # allows you to edit a single landmark

  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end 

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end 

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])

    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end

    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end 

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end 

  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end

    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end

    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  
  end 

end
