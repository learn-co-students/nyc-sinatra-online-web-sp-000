class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
