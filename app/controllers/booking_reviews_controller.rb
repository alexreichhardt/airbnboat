class BookingReviewsController < ApplicationController

  before_action :set_review, only: [ :show]


  def index
    @reviews = BookingReview.all
  end

  def show
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @bookingreview = BookingReview.new
  end

  def create
    @review = BookingReview.new(title: params[:booking_review][:title],
                                content: params[:booking_review][:content],
                                rating: params[:booking_review][:rating],
                                user_id: current_user.id,
                                booking_id: params[:booking_id])
    @review.save


    redirect_to booking_booking_review_path(params[:booking_id], @review.id)
  end

  def destroy
    @review = BookingReview.find(params[:id])
    @review.destroy

    redirect_to root_path
  end

  private

  def set_review
    @review = BookingReview.find(params[:id])
  end

end
