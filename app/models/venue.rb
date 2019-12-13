class Venue < ActiveRecord::Base
    has_many :reviews

    # def self.all_ratings
    #     return pluck(:rating).uniq
    # end
end
