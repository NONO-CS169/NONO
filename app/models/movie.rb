class Movie < ActiveRecord::Base
    def self.all_ratings
        return pluck(:rating).uniq
    end
end
