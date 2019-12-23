class Venue < ActiveRecord::Base
    has_many :reviews

    # def self.all_ratings
    #     return pluck(:rating).uniq
    # end
    def name
        venue_name
    end
end
