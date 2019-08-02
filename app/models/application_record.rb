module ApplicationRecord
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end
 
  module InstanceMethods
    def slugify
      self.name.downcase.tr(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |record|
        return record if record.slugyify == slug
      end

      return nil
    end
  end
end