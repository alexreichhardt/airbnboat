class Booking < ApplicationRecord
  belongs_to :user
  has_one :boat
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :license, presence: true
end
