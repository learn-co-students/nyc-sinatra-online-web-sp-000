class FiguresController < ApplicationController
  
get '/figures/new' do 
    erb :'figures/new'
end

post '/figures' do 
  @figure = Figure.create(params[:figure])
  unless params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
  end
  unless params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
  end
  @figure.save  
end
  
get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
end
  
get '/figures/:id' do
  @figure = Figure.find_by(params[:id])
  erb :'figures/show'
end 

get '/figures/:id/edit' do
  @figure = Figure.find_by(params[:id])
  erb :'figures/edit'  

  #view form to edit a single figure
end

patch '/figures/:id' do 
  @figure = Figure.find_by(params[:id])
  @figure.update(params[:figure])
  unless params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
  end
  unless params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
  end
  @figure.save  
  redirect("/figures/#{@figure.id}")
end
  #post- edit a single figure
  #redirect to /figures? or /figures/:id?

end
