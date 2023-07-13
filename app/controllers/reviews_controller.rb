class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.list = List.find(params[:list_id])
    if @review.save
      redirect_to list_path(params[:list_id])
    else
      flash[:alert] = 'Could not create the review'
      redirect_to list_path(params[:list_id]), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
