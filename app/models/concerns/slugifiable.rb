module Slugifiable

  module InstanceMethods
    def slug
      self.name.split(" ").collect{ |x| x.downcase }.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |x| x.slug == slug }
    end
  end

end
