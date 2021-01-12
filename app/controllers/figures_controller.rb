class FiguresController < ApplicationController

  get 'figures/new' do
    "Yes, it works"
  end

  post 'figures/new' do
    binding.pry
  end

end
