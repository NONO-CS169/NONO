class Venue < ActiveRecord::Base
    def self.all_locations
        return pluck(:location).uniq
    end
end
