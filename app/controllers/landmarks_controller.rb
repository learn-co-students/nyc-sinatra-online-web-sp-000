class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do 
    @landmarks=Landmark.all
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks' do 
    @landmark=Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed] )
    redirect "landmarks/#{@landmark.id}"
  end 
  
  get '/landmarks/:id' do
    @landmark=Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark=Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end 

  patch '/landmarks/:id' do
      @landmark=Landmark.find_by_id(params["id"])
      @landmark.update(name: params["landmark"]["name"])
      @landmark.update(year_completed: params["landmark"]["year_completed"])
      redirect "landmarks/#{@landmark.id}"
  end 

end


#<label>Add Title</label>
#<br>
#<br>
#<input type="text" name="figure[title]"  id="landmark_year_completed">
