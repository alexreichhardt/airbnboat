class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :boats
  has_many :user_reviews
  has_many :boat_reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :role, inclusion: { in: ["owner", "charterer"]}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
