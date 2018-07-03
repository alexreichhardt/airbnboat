class BoatsController < ApplicationController
  before_action :find_boat, only: [:show, :edit, :update, :destroy]

  def index
    if params.has_key?(:q)
      location = params[:q][:location]
      person_number_limit = params[:q][:person].to_i - 1
      boats_at_loc = Boat.all.where(city: location)
      boats_with_person_cap_at_loc = boats_at_loc.where("person_capacity > ?", person_number_limit)
      @boats = boats_with_person_cap_at_loc
      @search_capacity = person_number_limit
    else
      boat = Boat.find(params[:id])
      location = boat.city
      person_number_limit = params[:capacity].to_i
      boats_at_loc = Boat.all.where(city: location)
      boats_with_person_cap_at_loc = boats_at_loc.where("person_capacity > ?", person_number_limit)
      @boats = boats_with_person_cap_at_loc
    end
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    new_boat = Boat.new(boat_params)
    new_boat.user_id = current_user.id
    new_boat.save!
    redirect_to boat_path(new_boat)
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    @boat.save
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat.delete
    redirect_to root_path
  end


  private

  def find_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:title, :description, :city, :person_capacity, :price)
  end
end
