class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @boats = Boat.where(user_id: params[:id])
    @bookings = Booking.where(user_id: params[:id])
  end
end
