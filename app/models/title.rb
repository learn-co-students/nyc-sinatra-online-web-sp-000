require_relative 'concerns/slugifiable.rb'

class Title < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
