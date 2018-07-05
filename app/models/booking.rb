class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :booking_reviews
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :license, presence: true

  def owner_user
    self.boat.user
  end
end
