class ReviewsController < ApplicationController

  before_filter :authenticate_user!


  def create
    @review = Review.new params[:review]
    @review.user = current_user

    if @review.save
      redirect_to @review.vendor
    else
      render :action => 'new'
    end
  end
end
