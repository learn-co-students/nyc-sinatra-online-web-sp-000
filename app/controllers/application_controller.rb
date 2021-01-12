class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'

  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    titles = []
    landmarks = []
    if (params[:figure][:name])
      @figure.name = params[:figure][:name]
    end
    if (params[:figure][:title_ids])
      params[:figure][:title_ids].each do | sel |
        titles << Title.find(sel.to_i)
      end
    end
    if (params[:title][:name])
      @newTitle = Title.create(name: params[:title][:name])
      titles << @newTitle
    end
    @figure.titles = titles
    if (params[:figure][:landmark_ids])
      params[:figure][:landmark_ids].each do | sel |
        landmarks << Landmark.find(sel.to_i)
      end
    end
    if (params[:landmark][:name])
      @newLand = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      landmarks << @newLand
    end
    @figure.landmarks = landmarks
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures/new' do
    titles = []
    landmarks = []
    if (params[:figure][:title_ids])
      params[:figure][:title_ids].each do | sel |
        titles << Title.find(sel.to_i)
      end
    elsif (params[:title][:name])
      @newTitle = Title.create(name: params[:title][:name])
      titles << @newTitle
    end
    if (params[:figure][:landmark_ids])
      params[:figure][:landmark_ids].each do | sel |
        landmarks << Landmark.find(sel.to_i)
      end
    elsif (params[:landmark][:name])
      @newLand = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      landmarks << @newLand
    end
    @figure = Figure.create(name: params[:figure][:name], titles: titles, landmarks: landmarks)
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/post' do
    @landmark = Landmark.create(
      name: params[:landmark][:name],
      year_completed: params[:landmark][:year_completed]
      )
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id].to_i)
    if (params[:landmark][:name])
      @landmark.name = params[:landmark][:name]
    end
    if (params[:landmark][:year_completed])
      @landmark.year_completed = params[:landmark][:year_completed]
    end
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end


end
