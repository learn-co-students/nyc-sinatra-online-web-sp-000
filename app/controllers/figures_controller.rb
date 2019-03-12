class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params[:figure][:name])
      if !params[:title][:name].empty?
        title=Title.find_by(:name => params[:title][:name])
          if !title
            title=Title.create(:name => params[:title][:name])
          end
        @figure.titles << title
      elsif !!params[:figure][:title_ids]
        params[:figure][:title_ids].each do |title_id|
          title=Title.find(title_id)
          @figure.titles << title
        end
      else
      end

      if !params[:landmark][:name].empty?
        landmark=Landmark.find_by(:name => params[:landmark][:name])
          if !landmark
            landmark=Landmark.create(params[:landmark])
          end
        @figure.landmarks << landmark
      else
        params[:figure][:landmark_ids].each do |landmark_id|
          landmark=Landmark.find(landmark_id)
          @figure.landmarks << landmark
        end
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    if !params[:figure][:name].empty?
      @figure.name=params[:figure][:name]
    end

    if !params[:title][:name].empty?
      title=Title.find_by(:name => params[:title][:name])
        if !title
          title=Title.create(:name => params[:title][:name])
        end
      @figure.titles << title
    elsif !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        title=Title.find(title_id)
        @figure.titles << title
      end
    else
    end

    if !params[:landmark][:name].empty?
      landmark=Landmark.find_by(:name => params[:landmark][:name])
        if !landmark
          landmark=Landmark.create(params[:landmark])
        end
      @figure.landmarks << landmark
    else
      params[:figure][:landmark_ids].each do |landmark_id|
        landmark=Landmark.find(landmark_id)
        @figure.landmarks << landmark
      end
    end

    @figure.save
    erb :'figures/show'
  end

end
