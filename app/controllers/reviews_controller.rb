class ReviewsController < ApplicationController

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

end
