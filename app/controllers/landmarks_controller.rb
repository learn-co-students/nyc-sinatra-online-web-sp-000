class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  post '/landmarks' do 
    #new landmark entered
    new_landmark = params[:landmark]
 
    #create new landmark 
    @landmark = Landmark.create(new_landmark)  
    redirect to "/landmarks/#{@landmark.id}"
  end 

  get '/landmarks/new' do 
    erb :"landmarks/new"
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end 
  


  patch '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])  
      @landmark.update(params[:landmark])

     @landmark.save 
      redirect to "landmarks/#{@landmark.id}"
  end

end
