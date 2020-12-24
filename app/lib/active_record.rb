class ActiveRecord::Base
    def slug
        Slugifiable.call(self.name)
    end

    def self.find_by_slug(slug)
        self.all.each do |item|
            if item.slug == slug
                return item
            end
        end
    end
end