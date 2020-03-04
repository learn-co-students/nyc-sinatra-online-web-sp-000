class LandmarksController < ApplicationController

  get('/landmarks') {@landmarks=Landmark.all; @figures=Figure.all; erb :'landmarks/index'}
  get('/landmarks/new') {erb :'landmarks/new'}
  get('/landmarks/:id') {@landmark=Landmark.find(params[:id]); erb :'landmarks/show'}
  get('/landmarks/:id/edit') {@landmark=Landmark.find(params[:id]); erb :'landmarks/edit'}

  post '/landmarks' do
    Landmark.create(
      name: params['landmark']['name'],
      year_completed: params['landmark']['year_completed']
    )
    redirect to '/landmarks'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
