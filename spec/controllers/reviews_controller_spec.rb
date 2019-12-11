require 'rails_helper'

describe ReviewsController do
  describe "create" do
    it "should increase the total number of reviews by 1" do
      # Create Venue to create review for.
      # Should be calling: POST, /venues(.:format), venues#create
      original_controller = @controller
      @controller = VenuesController.new
      v = post :create, venue: {
        :venue_name => 'Wheeler Hall',
        :location => 'Berkeley',
        season: "Season (Y/N/S)"
      }
      @controller = original_controller
      # Create Review
      # POST /venues/:venue_id/reviews(.:format), reviews#create
      expect { post :create,
        venue_id: 1,
        review_params: {votes: 20, venue_id: 1, user_id: 1, included_audience_stars: 5, included_audience_text: "cool",
          programming_representation_stars: 5, programming_representation_text: "cool", food_representation_stars: 3,
          food_representation_text: "cool", personal_comfort_stars: 3, personal_comfort_text: "cool", staff_comfort_stars: 4,
          staff_comfort_text: "cool", cast_representation_stars: 3, cast_representation_text: "cool", whole_venue_stars: 4,
          whole_venue_text: "cool", show_overview_stars: 3, show_overview_text: "cool", affinity: "Child Friendly"}
      }.to change(Review, :count).by(1)
    end
  end

  describe "destroy" do
    it "should decrease the total number of reviews by 1" do
      # Create Venue to create review for.
      # Should be calling: POST, /venues(.:format), venues#create
      post :create, venue: {
        :venue_name => 'Wheeler Hall',
        :location => 'Berkeley',
        season: "Season (Y/N/S)"
      }

      # Create Review
      # POST /venues/:venue_id/reviews(.:format), reviews#create
      expect { post :create,
        venue_id: 1
      }.to change(Review, :count).by(1)

      # Delete Review
      # DELETE /venues/:venue_id/reviews/:id(.:format), reviews#destroy
      expect { delete :destroy,
        venue_id: 1,
        id: 1 # TODO: Is this correct review ID?
      }.to change(Review, :count).by(-1)
    end
  end

  describe "downvote" do
    it "should decrease the total number of votes for a review by 1" do
      # Create Venue to create review for.
      # Should be calling: POST, /venues(.:format), venues#create
      post :create, venue: {
        :venue_name => 'Wheeler Hall',
        :location => 'Berkeley',
        season: "Season (Y/N/S)"
      }

      # Create Review
      # POST /venues/:venue_id/reviews(.:format), reviews#create
      expect { post :create,
        venue_id: 1
      }.to change(Review, :count).by(1)

      # Create downvote
      # POST /review/:venue/:id/downvote(.:format), reviews#downvote
      expect { post :downvote,
        venue: 1,
        id: 1 # TODO: Is this correct review ID?
      }.to change(review, :votes).by(-1)
      # TODO: Is this correct way to grab number of votes?
    end
  end
end
