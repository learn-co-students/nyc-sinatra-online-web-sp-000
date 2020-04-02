class FiguresController < ApplicationController
  
	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find_by_id(params[:id])
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/edit'
	end

	post '/figures' do
		@figure = Figure.find_or_create_by(name: params[:figure][:name])
		@figure.title_ids = params[:figure][:title_ids]
		@figure.landmark_ids = params[:figure][:landmark_ids]	
		if !params[:title][:name].empty?
			@figure.titles << Title.create(name: params[:title][:name])
		end
		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(name: params[:landmark][:name])
		end
		redirect "/figures/#{@figure.id}"
	end

	patch '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@figure.title_ids = params[:figure][:title_ids]
		@figure.landmark_ids = params[:figure][:landmark_ids]
		if !params[:figure][:name].empty?
			@figure.name = params[:figure][:name]
		end
		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(name: params[:landmark][:name])
		end
		@figure.save
		redirect "/figures/#{@figure.id}"
	end
		
	

end
