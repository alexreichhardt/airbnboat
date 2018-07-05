class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @boats = Boat.where(user_id: params[:id])
    @bookings = Booking.where(user_id: params[:id])
  end

  def edit_avatar
    @user = User.new
  end

  def new_avatar
    @user = User.where(id: current_user.id)
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit( :avatar)
  end
end
