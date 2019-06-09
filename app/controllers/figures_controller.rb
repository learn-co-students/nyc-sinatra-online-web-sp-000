class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end 

  post '/figures' do 
    #new figure entered
    new_figure = params[:figure][:name]

    #new title entered
    new_title = params[:title][:name]
    title_ids = params[:figure][:title_ids]

    #new landmark entered
    new_landmark = params[:landmark][:name]
    landmark_ids = params[:figure][:landmark_ids]

    #create new figure 
    @figure = Figure.create(name: new_figure)

    # create new title if new title was entered 
    if !new_title.empty?
      @figure.titles << Title.create(name: new_title)
    end

    # add selected title ids to figure.titles
    if title_ids
      title_ids.each do |id|
        @figure.titles << Title.find(id)
      end
    end

    # create new landmark if new landmark was entered 
    if !new_landmark.empty?
      @figure.landmarks << Landmark.create(name: new_landmark)
    end

    # add selected landmark ids to figure.landmarks
    if landmark_ids
      landmark_ids.each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    @figure.save
     redirect to "/figures/#{@figure.id}"

  end 

  get '/figures/:id' do 
     @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end 

  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/edit"
  end 

  patch '/figures/:id' do
    #new figure entered
    new_figure = params[:figure][:name]

    #new title entered
    new_title = params[:title][:name]
    title_ids = params[:figure][:title_ids]
     
    #new landmark entered
    new_landmark = params[:landmark][:name]
    
    landmark_ids = params[:figure][:landmark_ids]
 
    #find figure 
    @figure = Figure.find_by(id: params[:id])
    @figure.name = new_figure

    # add selected title ids to figure.titles
    if title_ids
      @figure.titles.clear
        title_ids.each do |id|
          @figure.titles << Title.find(id)
        end
    end

    # create new title if new title was entered 
    if !new_title.empty?
      @figure.titles << Title.create(name: new_title)
    end

    # add selected landmark ids to figure.landmarks
    if landmark_ids
      @figure.landmarks.clear
      landmark_ids.each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    # create new landmark if new landmark was entered 
    if !new_landmark.empty?
       @figure.landmarks << Landmark.create(name: new_landmark)
    end

     @figure.save 
      redirect to "figures/#{@figure.id}"
  end



end
