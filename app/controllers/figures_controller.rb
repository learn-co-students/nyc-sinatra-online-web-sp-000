class FiguresController < ApplicationController
  
  get "/figures" do 
    @figures = Figure.all 
    erb :"/figures/index"
  end
  
  get "/figures/new" do 
    @titles = Title.all 
    @landmarks = Landmark.all 
    erb :"/figures/new"
  end 
  
  post "/figures" do 
     if params["figure"]["name"] == ""
      redirect to "figures"
     end
     
    @figure = Figure.create(params[:figure])
    #@figure.titles = []
    #@figure.landmarks = []
     if !params["title"]["name"].empty?
        if @title = Title.find_by(name: params["figure"]["title_id"])
          @figure.titles << @title 
          @figure.save 
        else
          @figure.titles << Title.create(name: params["title"]["name"])
          @figure.save 
        end
     end
     if !params["landmark"]["name"].empty?
        if @landmark = Landmark.find_by(name: params["landmark"]["name"])
        @figure.landmarks << @landmark
        @figure.save
        else
        @figure.landmarks << Landmark.create(name: params["landmark"]["name"], figure_id: params["figure"][:id] ,year_completed: params["landmark"]["year_completed"])
        @figure.save
        end

     end
    redirect to "figures/#{@figure.id}"
  end
  
  get "/figures/:id" do 
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
  
  get "/figures/:id/edit" do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :"figures/edit"
  end
  
  patch "/figures/:id" do 
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])

    if !params["title"]["name"].empty?
        if @title = Title.find_by(name: params["title"]["name"])
        @figure.landmark = @title
        @figure.save
        else
        @figure.title = Title.create(name: params["title"]["name"])
        @figure.save
        end
     else params["title"]["name"] == ""
        @figure.title = nil
        @figure.save
     end
    redirect to "/figures/#{@figure.id}"
  end
end