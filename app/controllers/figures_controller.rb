class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/figures/new' do
    erb :'figures/new'
  end

  post "/figures" do
    @figure = Figure.create(name: params[:figure_name])
    binding.pry
    if !params[:figure][:landmark_ids].nil?
      @landmark = Landmark.find(params[:figure][:landmark_ids][0])
      @figure.landmarks << @landmark
    end

    if !params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end

    if !params[:title][:name].blank?
      title = Title.create(params[:title])
      @figure.titles << title
    end
    if !params[:landmark][:name].blank?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end
    redirect to "figures/#{@figure.id}"
  end

  get "/figures/:figure_id" do
    @figure = Figure.find(params[:figure_id])
    erb :'figures/show'
  end

end
