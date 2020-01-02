class FiguresController < ApplicationController
  
get '/figures/new' do 
    #view form to create new figure
end

post '/figures/new' do 
    #post- create new figure with title, landmark, new title, new landmark title (checkboxes)
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
