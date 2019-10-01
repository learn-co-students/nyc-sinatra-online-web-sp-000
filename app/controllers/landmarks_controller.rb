class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index' 
  end

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks' do
     @landmark = Landmark.create(params[:landmark])
     @landmark.save
      redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do 
    binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params["landmark"]["name"].empty?
     @landmark.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
     if !params["title"]["name"].empty?
       @landmark.titles << Title.create(name: params["title"]["name"])
     end
   @landmark.save
    redirect "landmarks/#{@landmark.id}"
end

end
