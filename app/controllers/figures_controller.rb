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
    #list all figures (index)
end
  
get '/figures/:id/edit' do
  #view form to edit a single figure
end 

patch '/figures/:id/edit' do 
  #post- edit a single figure
  #redirect to /figures? or /figures/:id?
end

end
