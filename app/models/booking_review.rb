class BookingReview < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  # belongs_to :boat, through: :bookings
  validates :title, presence: true
  # validates :content, presence: true
  # validates :rating, presence: true
  # validates :rating, numericality: { only_integer: true }
  # validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
