class LandmarksController < ApplicationController
  get '/landmarks/new' do 
    #view form to create new landmark
  end
  
  post '/landmarks/new' do 
    #post- create new landkarm
  end
  
  get '/landmarks' do
    #list all landmarks (index)
  end 

  get '/landmarks/:id' do 
    #see single landmark 
  end
  
  get '/landmarks/:id/edit' do
    #view form to edit a landmark
  end

  patch '/landmarks/:id' do 
    #patch- edit a single landmark
    #redirect to '/landmarks/:id'
  end
end
