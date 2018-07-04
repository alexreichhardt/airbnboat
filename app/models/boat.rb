class Boat < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  has_many :boat_reviews, dependent: :destroy
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
end
