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
        params.require(:review).permit(:stars, :text)
    end
end
