class FiguresController < ApplicationController
  # add controller methods
  
  get '/figures' do
    erb :'/figures/index'
  end 

  get '/figures/new' do
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    #the figure hash is weird, sometimes it contains the title id or landmark ids even though theyre empty
    # {"figure"=>{"name"=>"Doctor Who", "title_ids"=>[" "]}, "title"=>{"name"=>""}, "landmark"=>{"name"=>"", "year_completed"=>""}}

    # {"figure"=>{"name"=>"Doctor Who", "land_markids"=>[" "]}, "title"=>{"name"=>""}, "landmark"=>{"name"=>"", "year_completed"=>""}}

    # {"figure"=>{"name"=>"Doctor Who"}, "title"=>{"name"=>"Time Lord"}, "landmark"=>{"name"=>"", "year_completed"=>""}}

    # {"figure"=>{"name"=>"Doctor Who"}, "title"=>{"name"=>""}, "landmark"=>{"name"=>"The Tardis", "year_completed"=>""}}

    # binding.pry

    #1.create a figure ewith name
    figure = Figure.create(name: params[:figure][:name])
   
    #2.use helper method to associate the titles and landmarks to figures: 
    asso_to_figure(figure, params)

    #try creating these things and associating them in tux before writing the code

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    "this controller action process the edit form"
    

    #this should be very similar to processing a create form
    #just work out the details
    #i'm thinking of moving these processor to a helpers section
    #the order you do things matter, cuz first you're clearing things and then, adding things
    
    #update name
    figure = Figure.find_by(id: params[:id])
    figure.update(name: params[:figure][:name])


    #------ CLEAR LANDMARKS ----------
    #clear landmarks from figure and clear figure from landmarks
    #a) loop through landmark, remove the figure from the landmark
    figure.landmarks.each do | landmark |
      landmark.figure = nil
    end
    #b) remove landmarks from landmark collection of figure
    figure.landmarks.clear
    
    
    #----------CLEAR TITLES ------------
    #a) go to RELEVANTtitles and clear RELEVANT FIGURES: loop thru each title,
    figure.titles.each do | title |
      title.figures.delete(figure)
    end
     #that will delete the item from the array but the item is not removed from existence
     #like i dont know how ruby works in temr of refernce vs copy. under the hood stuff.

    #b) then clear the titles from the figure. must do the prevous step first!!!
    figure.titles.clear
    #u have to do both ways because paparently unlike landmarks it doesnt' clear itself

    #----------ADD landmark ids, title ids, add new landmark, add new titles ------------
    asso_to_figure(figure, params)

    redirect to "/figures/#{params[:id]}"
  end 

  helpers do

    def asso_to_figure(figure, params)

      #---------------start of method ---------------
       #2. if there is NEW landmark 
    if !params[:landmark][:name].empty? #(if name not an empty string)
      newlandmark = Landmark.create(params[:landmark]) #will give it name and year_completed attributes
      figure.landmarks << newlandmark
      figure.save
       #add to landmark collection of figure
      #apparently if done this way, the landmark will have its figure_id filled out
      #if i did like figure.landmark_ids = [x,y,z] the landamrks with ids x y z don't have the figure_id 
      #even if u save....
    end
    #3. if there is NEW title
    if !params[:title][:name].empty?  #(if name not an empty string)
      newtitle = Title.create(params[:title]) #will give it name 
      figure.titles << newtitle #add to title collection of figure
      #weird. if i do newtitle.figures, the figure is not in it. but if add with  newtitle.figures << figure, suddenly i get duplicate titles in my figure.....
      figure.save # must save, otherwise you'll have to add to figure collection of titles
    end

    #4. if there is  landmark ids
        #Warning: if u just assign landmark.title_ids = [x,y,z] it will get rid of all the previous stuff...
    #so be careful with using that. u never know what u do in the future. best to avoid. use the <<. more gentle

    if params[:figure].include?("landmark_ids") 
      #if !params[:figure][:landmark_ids].empty? && params[:figure][:landmark_ids].first != " " && params[:figure][:landmark_ids].first != ""
      
        params[:figure][:landmark_ids].each do | number |
          thelandmark = Landmark.find_by(id: number)
          figure.landmarks << thelandmark
          figure.save
        end

    #end
    end

    #5. if there is title ids
    if params[:figure].include?("title_ids")
      #if !params[:figure][:title_ids].empty? && params[:figure][:title_ids].first != " " && params[:figure][:title_ids].first != ""

    #Warning: if u just assign figure.title_ids = [x,y,z] it will get rid of all the previous stuff...
    #so be careful with using that. u never know what u do in the future. best to avoid. use the <<. more gentle
       params[:figure][:title_ids].each do | number |
        thetitle = Title.find_by(id: number)
        

        figure.titles << thetitle
        #thetitle.figures << figure #causes duplicates so disabled.
        thetitle.save #TEST LINE, may break 
        figure.save
       end

      #end
    end

    

    #---------------end of method ---------------
    end 

  end #end helpers 
end
