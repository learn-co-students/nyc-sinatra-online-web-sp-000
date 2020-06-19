class FiguresController < ApplicationController
  # add controller methods
 
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
    @figure=Figure.find_or_create_by(name: params["figure"]["name"])

    if params["figure"].include?("title_ids")
      titles=Title.find_by(name: params["figure"]["title_ids"])
      title_figure=FigureTitle.find_or_create_by(title_id: titles.id, figure_id: @figure.id)
    elsif !params["title"]["name"].empty?
      titles=Title.find_or_create_by(name: params["title"]["name"])
      title_figure=FigureTitle.find_or_create_by(title_id: titles.id, figure_id: @figure.id)
    elsif params["figure"].include?("landmark_ids") 
      landmark=Landmark.find_by(name: params["figure"]["landmark_ids"])
      landmark.update(figure_id: @figure.id)
    elsif !params["landmark"]["name"].empty?
     new_landmark=Landmark.find_or_create_by(name: params["landmark"]["name"])
     new_landmark.update(figure_id: @figure.id)
    end
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figures=Figure.find_by_id(params["id"]) 
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure=Figure.find_by_id(params["id"])
    @figure.update(name:params["figure"]["name"])
    
    if !params["title"]["name"].empty?
      title=Title.find_or_create_by(name:params["title"]["name"])
      figure_title=FigureTitle.find_or_create_by(title_id: title.id)
      figure_title.update(figure_id: @figure.id)
    elsif params["figure"].include?("title_ids")
      title=Title.find_by(name: params["figure"]["title_ids"])
      figure_title=FigureTitle.find_or_create_by(title_id: title.id)
      figure_title.update(figure_id: @figure_id)
    
    elsif params["figure"].include?("landmark_ids")
      landmark=Landmark.find_or_create_by(name: params["figure"]["landmark_ids"])
      landmark.update(figure_id: @figure.id)
    elsif !params["landmark"]["name"].empty?
      landmark=Landmark.find_or_create_by(name: params["landmark"]["name"])
      landmark.update(figure_id: @figure.id)
    end
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figures=Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end 

end
#params={"_method"=>"patch", "figure"=>{"name"=>"", "landmark_ids"=>["You Know Me"]}, "landmark"=>{"name"=>""}, "id"=>"1"}
#params={"_method"=>"patch", "figure"=>{"name"=>""}, "landmark"=>{"name"=>"New Jersey Stadium"}, "id"=>"1"}