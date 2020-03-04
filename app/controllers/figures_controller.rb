class FiguresController < ApplicationController

  def figure_fill(figure, patch = false)
    figure.update(params[:figure]) if patch
    figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
    figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    figure.save
    redirect to "/figures/#{figure.id}"
  end

  get('/figures') {@figures = Figure.all; erb :'figures/index'}
  get('/figures/new') {erb :'figures/new'}
  get('/figures/:id') {@figure = Figure.find(params[:id]); erb :'figures/show'}
  get('/figures/:id/edit') {@figure = Figure.find(params[:id]); erb :'figures/edit'}
  post('/figures') {figure_fill(Figure.create(params['figure']))}
  patch('/figures/:id') {figure_fill(Figure.find_by_id(params[:id]), true)}

end
