require_relative './concerns/slugifiable.rb'

class Landmark < ActiveRecord::Base
  belongs_to :figure

  include Slugifiable
  extend Slugifiable
end
