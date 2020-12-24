class Slugifiable
    def self.call(text)
        if text.gsub!(/[^0-9A-Za-z ]/, '')
            text.split(" ").join("-").downcase
        else
            text.split(" ").join("-").downcase
        end
    end
end