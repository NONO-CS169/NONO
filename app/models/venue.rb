class Venue < ActiveRecord::Base
    def self.all_ratings
        return pluck(:venue_name).uniq
    end
end
