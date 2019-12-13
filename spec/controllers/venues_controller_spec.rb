require 'rails_helper'

describe VenuesController do
  describe "create" do
    it "should increase the total number of venues by 1" do
      expect { post :create,
        venue: {
          :venue_name => 'Wheeler Hall',
          :location => 'Berkeley',
          season: "Season (Y/N/S)"
        }
      }.to change(Venue, :count).by(1)
    end
  end

  describe "destroy" do
    it "should decrease the total number of venues by 1" do
      expect { post :create,
        venue: {
          :venue_name => 'Wheeler Hall',
          :location => 'Berkeley',
          season: "Season (Y/N/S)"
        }
      }.to change(Venue, :count).by(1)

      expect { post :destroy,
        :id => 1
      }.to change(Venue, :count).by(-1)
    end
  end
end
