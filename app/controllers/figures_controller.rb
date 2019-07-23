class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

get '/figures/new' do
  @landmarks = Landmark.all
  @titles = Title.all
  erb :'/figures/new'
end

post '/figures' do
  @figure = Figure.create(name: params[:figure][:name])
#  binding.pry

  if !params["title"]["name"].empty?
  @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    elsif params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(params[:figure][:title_ids])
  end

  if !params["landmark"]["name"].empty?
  @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    elsif
      @figure.landmarks << Landmark.find_or_create_by(params[:figure][:landmark_ids])
  end

  @figure.save

  redirect "/figures/#{@figure.id}"
end

get "/figures/:id" do
  @figure = Figure.find(params[:id])

  erb :'/figures/show'
end




get '/figures/:id/edit' do
  @figure = Figure.find(params[:id])
  @landmarks = Landmark.all
  @titles = Title.all
  erb :'/figures/edit'
end

patch '/figures/:id' do
  @figure = Figure.find(params[:id])
  @figure.update(name: params[:figure][:name])



  @figure.titles = Title.find_or_create_by(params[:figure][:title_ids])


  @figure.landmarks = Landmark.find_or_create_by(params[:figure][:landmark_ids])

  @figure.save

  redirect "/figures/#{@figure.id}"
end

end
