require_relative './concerns/slugifiable.rb'
class Title < ActiveRecord::Base
  # add relationships here
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethod
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
