class ReviewsController < ApplicationController

    def new
        if current_user
            set_restaurant()
        else
            redirect_to new_user_session_path
        end
    end

    def create
        set_restaurant()
        @review = current_user.reviews.build(review_params)
        @review.venue = @venue
        @review.votes = 0
  		@review.save
        redirect_to venue_path(@venue)
    end

    def upvote
        id = params[:id]
        review = Review.find(id)
        review.votes += 1
        review.save
        redirect_to venue_path(params[:venue])
    end

    def downvote
        id = params[:id]
        review = Review.find(id)
        review.votes -= 1
        review.save
        redirect_to venue_path(params[:venue])
    end

    private

    def set_restaurant
        @venue = Venue.find(params[:venue_id])
    end

    def review_params
        params.require(:review).permit(:included_audience_stars, 
        :included_audience_text,
        :programming_representation_stars,
        :programming_representation_text,
        :food_representation_stars,
        :food_representation_text,
        :personal_comfort_stars,
        :personal_comfort_text,
        :staff_comfort_stars,
        :staff_comfort_text,
        :cast_representation_stars,
        :cast_representation_text,
        :whole_venue_stars,
        :whole_venue_text,
        :show_overview_stars,
        :show_overview_text)
    end
end
