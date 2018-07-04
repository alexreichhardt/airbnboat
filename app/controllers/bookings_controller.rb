class BookingsController < ApplicationController

  before_action :set_booking, only: [:show]

  def index # not needed at first?
    # @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    if user_signed_in?
      boat = Boat.find(params[:boat_id])
      start_date = params[:start_date]
      end_date = params[:end_date]
      @persons_going = params[:persons_going]
      price = (boat.price.to_i * (end_date.to_date - start_date.to_date)).to_i
      @booking = Booking.new(user_id: current_user.id,
                              boat_id: boat.id,
                              start_date: start_date,
                              end_date: end_date,
                              price: price)
    else
      redirect_to new_user_session_path(redirect_to: new_boat_booking_path(id: params[:boat_id], price: params[:price],
                                        capacity: params[:capacity], start_date: params[:start_date], end_date: params[:end_date],
                                        persons_going: params[:persons_going]))
    end
  end

  def create

    booking = Booking.new(user_id: current_user.id,
                            boat_id: params[:boat_id],
                            start_date: params[:start_date],
                            end_date: params[:end_date],
                            price: params[:end_date]
                            )
    booking.save


    redirect_to boat_booking_path(params[:boat_id], booking.id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

