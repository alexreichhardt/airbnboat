class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :booking_reviews
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :license, presence: true

  def self.booked_dates(boats)
    if boats.size == 1
      all_dates = boats.first.bookings.map{|booking| [booking.start_date, booking.end_date]}
    else
      all_dates = boats.map{|boat| boat.bookings }.flatten.map{|booking| [booking.start_date, booking.end_date]}
    end
    # EX:
    # all_dates = [[Wed, 01 Aug 2018, Thu, 02 Aug 2018], [Wed, 08 Aug 2018, Thu, 15 Aug 2018]]
  end

  def owner_user
    self.boat.user
  end
end


