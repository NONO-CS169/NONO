require 'rails_helper'

describe ReviewsController do
  describe "create" do
    it "should increase the total number of reviews by 1" do
      difference = 1
      initial_count = Review.count

      user = User.find_or_initialize_by(email: 'user1@gmail.com')
      user.update_attributes(
          email: 'user1@gmail.com',
          password: 'password',
          password_confirmation: 'password',
      )
      venue = Venue.create(:venue_name => 'Wheeler Hall', :location => 'Berkeley', season: "Season (Y/N/S)")

      Review.create(votes: 10, venue_id: venue.id, user_id: user.id, included_audience_stars: 5, included_audience_text: "cool",
                               programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
                               food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
                               staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
                               whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "LGBTQIA")

      final_count = Review.count
      expect(final_count - initial_count).to eq(difference)
    end
  end

  describe "destroy" do
    it "should increase the total number of reviews by 1" do
      difference = 1
      initial_count = Review.count

      user = User.find_or_initialize_by(email: 'user1@gmail.com')
      user.update_attributes(
          email: 'user1@gmail.com',
          password: 'password',
          password_confirmation: 'password',
      )
      venue = Venue.create(:venue_name => 'Wheeler Hall', :location => 'Berkeley', season: "Season (Y/N/S)")

      Review.create(votes: 10, venue_id: venue.id, user_id: user.id, included_audience_stars: 5, included_audience_text: "cool",
                               programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
                               food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
                               staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
                               whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "LGBTQIA")

      final_count = Review.count
      expect(final_count - initial_count).to eq(difference)

      difference = -1
      initial_count = Review.count
      Review.destroy(1)
      final_count = Review.count
      expect(final_count - initial_count).to eq(difference)
    end
  end
end
