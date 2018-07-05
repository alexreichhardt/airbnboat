class Boat < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true


  # validates :name, presence: true
  # validates :name, uniqueness: true
   validates :person_capacity, presence: true
   validates :person_capacity, numericality: { only_integer: true }
  # validates :year, presence: true
  # validates :year, numericality: { only_integer: true }
  # validates :length, presence: true
  # validates :length, numericality: { only_integer: true }
  # validates :fuel_type, presence: true
  # validates :model, presence: true
  # validates :horse_power, presence: true
  # validates :sleeps, presence: true
  # validates :sleeps, numericality: { only_integer: true }
  # validates :fuel_capacity, presence: true
  # validates :fuel_capacity, numericality: { only_integer: true }
  # validates :required_license, presence: true
   validates :price, presence: true
   validates :price, numericality: { only_integer: true }
  # validates :start_date, presence: true
  # validates :end_date, presence: true
   validates :city, presence: true
  # validates :street, presence: true
  # validates :location_details, presence: true
  # validates :zipcode, presence: true
  # validates :country, presence: true
  # validates :engine, presence: true

  def avg_rating
    reviews = bookings.map{|booking| booking.booking_reviews}.flatten
    all_ratings = reviews.map{|review| review.rating} # [3,2,5,0]
    return nil if all_ratings.empty?
    sum_of_ratings = all_ratings.inject(0){|sum, x| sum + x }

    (sum_of_ratings.to_f / all_ratings.size.to_f).round(1)
  end

  def total_rating
    reviews = bookings.map{|booking| booking.booking_reviews}.flatten
    all_ratings = reviews.map{|review| review.rating} # [3,2,5,0]

    all_ratings.size
  end

  def owner
    owner = User.where(id: self.user_id)

    owner
  end



end
