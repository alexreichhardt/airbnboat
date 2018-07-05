class BoatsController < ApplicationController
  before_action :find_boat, only: [:show, :edit, :update, :destroy]

  def index
    raise

    if params.has_key?(:criteria)
      @start_date = params[:criteria][:starts_at]
      @end_date = params[:criteria][:ends_at]
      @persons_going = params[:criteria][:person].to_i

      @location = params[:criteria][:location]

      @person_number_limit = params[:criteria][:person].to_i

      #Limiting the Location
      @boats = Boat.near(params[:criteria][:location], 10)

      #Filtering for Booking dates
      ##Saving the dates from params
      from = Date.parse(@start_date)
      to = Date.parse(@end_date)
      ##1Step: Joining boats & bookings Table
      ##2Step: Extracting all IDs which lie within the given start and end date
      booked_boat_ids = @boats.joins(:bookings).where("(bookings.start_date < :sd AND bookings.end_date > :sd) OR (bookings.start_date < :ed AND bookings.end_date > :ed)", sd: from, ed: to).uniq.pluck(:id)
      ##3Step: Saving all boats which ID's are not included in the "booked_boats_ids"
      @boats = @boats.where.not(id: booked_boat_ids)

      #Filtering for Boat Availabilty
      boats_available = @boats.where("start_date IS NOT NULL AND end_date IS NOT NULL AND start_date < :sd AND end_date > :ed", sd: from, ed: to).uniq.pluck(:id)

      @boats = @boats.where(id: boats_available)
      #Filtering for Person Capacity
      @boats = @boats.where("person_capacity >= ?", @person_number_limit)

      # @boats = @boats.where()
      # location = params[:criteria][:location]
      # person_number_limit = params[:criteria][:person].to_i - 1
      # boats_at_loc = Boat.all.near(params[:criteria][:location], 1000)
      # boats_with_person_cap_at_loc = boats_at_loc.where("person_capacity > ?", person_number_limit)
      # @boats = boats_with_person_cap_at_loc



    elsif params.has_key?(:pricefilter)
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @persons_going = params[:persons_going].to_i
      @location = params[:location]
      @person_number_limit = params[:capacity].to_i
      #Limiting the Location
      @boats = Boat.near(params[:location], 10)

      #Filtering for Booking dates
      ##Saving the dates from params
      from = Date.parse(@start_date)
      to = Date.parse(@end_date)
      ##1Step: Joining boats & bookings Table
      ##2Step: Extracting all IDs which lie within the given start and end date
      booked_boat_ids = @boats.joins(:bookings).where(("(bookings.start_date < :sd AND bookings.end_date > :sd) OR (bookings.start_date < :ed AND bookings.end_date > :ed)"), sd: from, ed: to).uniq.pluck(:id)
      ##3Step: Saving all boats which ID's are not included in the "booked_boats_ids"
      @boats = @boats.where.not(id: booked_boat_ids)
      boats_available = @boats.where("start_date IS NOT NULL AND end_date IS NOT NULL AND start_date < :sd AND end_date > :ed", sd: from, ed: to).uniq.pluck(:id)
      @boats = @boats.where(id: boats_available)
      #Filtering for Person Capacity
      @boats = @boats.where("person_capacity >= ?", @person_number_limit)

      #Filtering for Price
      @boats = @boats.where("price < ?", params[:price].to_i )

      @price = params[:price].to_i

    elsif params.has_key?(:fromshow)

      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @persons_going = params[:person].to_i
      @person_number_limit = params[:capacity].to_i

      #Limiting the Location
      @boats = Boat.near(params[:location], 10)

      #Filtering for Booking dates
      ##Saving the dates from params
      from = Date.parse(@start_date)
      to = Date.parse(@end_date)
      ##1Step: Joining boats & bookings Table
      ##2Step: Extracting all IDs which lie within the given start and end date
      booked_boat_ids = @boats.joins(:bookings).where(("(bookings.start_date < :sd AND bookings.end_date > :sd) OR (bookings.start_date < :ed AND bookings.end_date > :ed)"), sd: from, ed: to).uniq.pluck(:id)
      boats_available = @boats.where("start_date IS NOT NULL AND end_date IS NOT NULL AND start_date < :sd AND end_date > :ed", sd: from, ed: to).uniq.pluck(:id)
      @boats = @boats.where(id: boats_available)

      ##3Step: Saving all boats which ID's are not included in the "booked_boats_ids"
      @boats = @boats.where.not(id: booked_boat_ids)

      #Filtering for Person Capacity
      @boats = @boats.where("person_capacity >= ?", @person_number_limit)


      unless params[:price].nil?
        @boats = @boats.where("price < ?", params[:price].to_i )
        @price = params[:price].to_i
      end
      @location = params[:location]




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
    @persons_going = params[:perons_going]
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
    params.require(:boat).permit(:title, :description, :city, :person_capacity, :price, :photo, :start_date, :end_date)
  end
end
