require 'rails_helper'

describe VenuesController do
  describe "create" do
    it "should increase the total number of venues by 1" do
      difference = 1
      initial_count = Venue.count
      Venue.create(:venue_name => 'Wheeler Hall', :location => 'Berkeley', season: "Season (Y/N/S)")
      final_count = Venue.count
      expect(final_count - initial_count).to eq(difference)
    end
  end

  describe "destroy" do
    it "should decrease the total number of venues by 1" do
      difference = 1
      initial_count = Venue.count
      Venue.create(:venue_name => 'Wheeler Hall', :location => 'Berkeley', season: "Season (Y/N/S)")
      final_count = Venue.count
      expect(final_count - initial_count).to eq(difference)

      difference = -1
      initial_count = Venue.count
      Venue.destroy(1)
      final_count = Venue.count
      expect(final_count - initial_count).to eq(difference)
    end
  end
end
