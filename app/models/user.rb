class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :boats, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :booking_reviews, dependent: :destroy

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :role, inclusion: { in: ["owner", "charterer"]}, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
