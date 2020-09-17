class FiguresController < ApplicationController
  
  get '/figures' do
  	@figures = Figure.all
  	erb :'/figures/index'
  end

  get '/figures/new' do 
  	 @titles = Title.all
  	 @landmarks = Landmark.all
  	 erb :'figures/new'
  end

  post '/figures' do
  	 figure = Figure.create(params[:figure])
  	 #binding.pry

  	if params[:figure][:title_ids]
  	   params[:figure][:title_ids].each do |t_id|
  	   figure.titles << Title.find(t_id)
  	   end
  	end

  	if !params[:title][:name].empty?
       title = Title.create(params[:title])
  	   figure.titles << title
  	end


  	if params[:figure][:landmark_ids]
  	   params[:figure][:landmark_ids].each do |l_id|
  	   figure.landmarks << Landmark.find(l_id)
  	   end
  	end 	 

  	 if !params[:landmark][:name].empty?
       landmark = Landmark.create(params[:landmark])
  	   figure.landmarks << landmark
  	 end
  	 figure.save
  	 redirect to "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
   	@figure = Figure.find(params[:id])
  	erb :'/figures/edit'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end


  patch '/figures/:id' do
  	figure = Figure.find(params[:id])
  	figure.update(name: params[:figure][:name])

    if params[:figure][:title_ids]
       params[:figure][:title_ids].each do |t_id|
       figure.titles << Title.find(t_id)
       end
    end

    if !params[:title][:name].empty?
       title = Title.create(params[:title])
       figure.titles << title
    end 	


    if params[:figure][:landmark_ids]
       params[:figure][:landmark_ids].each do |l_id|
       figure.landmarks << Landmark.find(l_id)
       end
    end

     if !params[:landmark][:name].empty?
       landmark = Landmark.create(params[:landmark])
       figure.landmarks << landmark
     end
     figure.save
     redirect to "/figures/#{figure.id}"
  end
  
end
