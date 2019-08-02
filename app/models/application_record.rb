module ApplicationRecord
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def slug
      self.name.downcase.tr(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |record|
        return record if record.slug == slug
      end
      return nil
    end
  end
end
