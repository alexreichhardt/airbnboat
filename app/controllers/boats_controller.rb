class BoatsController < ApplicationController
  before_action :find_boat, only: [:show, :edit, :update, :destroy]

  def index

    if params.has_key?(:criteria)
      @start_date = params[:criteria][:starts_at]
      @end_date = params[:criteria][:ends_at]
      @persons_going = params[:criteria][:person].to_i

      location = params[:criteria][:location]
      person_number_limit = params[:criteria][:person].to_i - 1

      boats_at_loc = Boat.all.near(params[:criteria][:location], 10000)

      boats_with_person_cap_at_loc = boats_at_loc.where("person_capacity > ?", person_number_limit)
      @boats = boats_with_person_cap_at_loc
      @search_capacity = person_number_limit
    else
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @persons_going = params[:person].to_i
      boat = Boat.find(params[:id])
      location = boat.city
      person_number_limit = params[:capacity].to_i
      boats_at_loc = Boat.all.where(city: location)
      boats_with_person_cap_at_loc = boats_at_loc.where("person_capacity > ?", person_number_limit)
      @search_capacity = person_number_limit
      @boats = boats_with_person_cap_at_loc
    end


    # map:

    @cboats = @boats.where.not(latitude: nil, longitude: nil)
    @markers = @cboats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end



  end

  def show
    booking_ids = []
    all_booking_this_boat = Booking.where(boat_id: @boat.id)
    all_booking_this_boat.each do |booking|
       booking_ids << booking.id
    end
    @reviews = BookingReview.where("booking_id IN (?)", booking_ids)
    @persons_going = params[:persons_going]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @boat = Boat.find(params[:id])


     @marker =
      [{
        lat: @boat.latitude,
        lng: @boat.longitude
      }]

  end

  def new
    if user_signed_in?
      @boat = Boat.new
    else
      redirect_to new_user_session_path(redirect_to: new_boat_path)
    end
  end

  def create
    new_boat = Boat.new(boat_params)
    new_boat.user_id = current_user.id
    new_boat.save!
    redirect_to boat_path(new_boat)
  end

  def edit
    if user_signed_in? && current_user.id == @boat.user_id

    else
      redirect_to new_user_session_path(redirect_to: edit_boat_path(@boat.id))
    end
  end

  def update
    @boat.update(boat_params)
    @boat.save
    redirect_to boat_path(@boat)
  end

  def destroy
    if user_signed_in? && current_user.id == @boat.user_id
      @boat.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path(redirect_to: boat_path(@boat.id))
    end
  end

  private

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:title, :description, :city, :person_capacity, :price, :photo)
  end
end
