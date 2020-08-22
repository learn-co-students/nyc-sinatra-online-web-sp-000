class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  post '/landmarks' do
   @landmark  = Landmark.create(params[:landmark])
    
  end

get "/landmarks/:id/edit" do
  @landmark = Landmark.find_by(id: params[:id])
  erb :"landmarks/edit"
end

patch "/landmarks/:id" do
  @landmark = Landmark.find_by(id: params[:id])
  @landmark.name = params[:landmark][:name]
  @landmark.year_completed = params[:landmark][:year_completed]
  @landmark.save
  p @landmark.year_completed
  p @landmark.name
  # p params[:landmark][:year_completed].to_i
   redirect "/landmarks/#{@landmark.id}"
end

get "/landmarks/:id" do
    @landmark = Landmark.find_by(id: params[:id])
    # p params[:id]
  erb :"landmarks/show"
end
  

end
