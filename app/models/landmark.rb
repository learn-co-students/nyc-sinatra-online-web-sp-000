class Landmark < ActiveRecord::Base
  belongs_to :figure

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
