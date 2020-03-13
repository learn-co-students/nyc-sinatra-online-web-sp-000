module Slugifiable
    module InstanceMethods
        def slug
            self.name.parameterize
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find {|e| e.slug == slug}
        end
    end
end