class FiguresController < ApplicationController
  # add controller methods

	# => create
	get '/figures/new' do
		erb :'figures/new'
	end

	post '/figures' do
		# binding.pry
		@figure = Figure.create(name: params[:figure][:name])
		@figure.title_ids = params[:figure][:title_ids]
		@figure.landmark_ids = params[:figure][:landmark_ids]

		if !params[:title][:name].empty?
			@figure.titles << Title.create(params[:title])
		end

		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(params[:landmark])
		end

		redirect "/figures/#{@figure.id}"
	end

	# => read
	get '/figures' do
		# binding.pry
		@figures = Figure.all

		erb :'figures/index'
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])

		erb :'figures/show'
	end

	# => update
	get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])
		erb :'figures/edit'
	end

	patch '/figures/:id' do
		@figure = Figure.find(params[:id])
		@figure.update(name: params[:figure][:name])
		@figure.title_ids = params[:figure][:title_ids]
		@figure.landmark_ids = params[:figure][:landmark_ids]

		if !params[:title][:name].empty?
			@figure.titles << Title.create(params[:title])
		end

		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(params[:landmark])
		end

		redirect "/figures/#{@figure.id}"
	end

end
