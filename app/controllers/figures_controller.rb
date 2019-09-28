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

  post '/figures' do 
     @figure = figure.create(params[:figure])

      redirect "figures/#{@figure.id}"
  end

  # get '/figures/:id' do 
  #   @figure = Figure.find(params[:id])
  #   erb :'/figures/show'
  # end

  # get '/figures/:id/edit' do
  #   @figure = Figure.find_by_id(params[:id])
  #   @owners = Owner.all
  #   erb :'/figures/edit'
  # end

  # patch '/figures/:id' do 
  #   binding.pry
  #     ####### bug fix
  #     if !params[:figure].keys.include?("owner_id")
  #      params[:figure]["owner_id"] = []
  #      end
  #      #######
    
  #      @figure = Figure.find(params[:id])
  #      @figure.update(params["figure"])
  #      if !params["owner"]["name"].empty?
  #        @figure.owner << Owner.create(name: params["owner"]["name"])
  #      end
  #      redirect "figures/#{@figure.id}"
  # end

  #   patch '/figures/:id' do 
  #     binding.pry
  #     ####### bug fix
  #     if !params[:figure].keys.include?("owner_id")
  #      params[:figure]["owner_id"] = []
  #      end
  #      #######
    
  #      @figure = Figure.find(params[:id])
  #     #  @figure.update(params["figure"]["name"])
  #      @figure.name = params["figure"]["name"]
  #      if !params["owner"]["name"].empty?
  #       # @figure.owner.name = params["owner"]["name"]
  #       @figure.owner = Owner.create(name: params["owner"]["name"])
  #      else
  #       @figure.owner = Owner.find_by_id(params["figure"]["owner_id"])
  #       end
  #     @figure.save
  #      redirect "figures/#{@figure.id}"
  # end


# end
end
