class FiguresController < ApplicationController

  get "/figures" do 
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get "/figures/new" do
    erb :'figures/new'
  end

  post "/figures" do
    #binding.pry
     @figure = Figure.create(params[:figure])

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end 

     redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end


end
