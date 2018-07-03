class BookingsController < ApplicationController

  before_action :set_booking, only: [:show]

  def index # not needed at first?
    # @bookings = Booking.all
  end

  def show
  end

  def new

    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]

  end

  def create
    @booking = Booking.new(user_id: current_user.id,
                            boat_id: params[:boat_id],
                            start_date: params[:booking][:start_date],
                            end_date: params[:booking][:end_date],
                            license: params[:booking][:license])
    @booking.save


    redirect_to boat_booking_path(params[:boat_id], @booking.id)
    raise
  end

  def destroy # called from user profile?
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

