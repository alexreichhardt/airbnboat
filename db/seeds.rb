BookingReview.delete_all
Booking.delete_all
Boat.delete_all
User.delete_all

user1 = User.create(email: "jakob@lewagon.com", password: "jakob@lewagon.com", password_confirmation: "jakob@lewagon.com")
user2 = User.create(email: "bora@lewagon.com", password: "bora@lewagon.com", password_confirmation: "bora@lewagon.com")
user3 = User.create(email: "alex@lewagon.com", password: "alex@lewagon.com", password_confirmation: "alex@lewagon.com")

cities = ["Istanbul", "Milano", "Como", "Paris","Milano","Milano"]
photos = ["boat1.jpg", "boat2.jpg"]

8.times do |i|
  boat = Boat.create(title: "Boat #{i}", description: "dummy text ever since the 1500", user_id: User.all.pluck(:id).sample, city: cities.sample, person_capacity: rand(1..10), price: rand(50..1000))
  boat.photo = File.open(Rails.root.join("db", "seeds", photos.sample))
  boat.save
end

# booking = Booking.create(user_id: user2.id, boat_id: boat1.id)
# review = BookingReview.create(title: "hi", user_id: user2.id, booking_id: booking.id)

# puts "booking.id:"
# puts booking.id

# puts "Owner:"
# puts booking.owner_user.email # dam@dln.name

# puts "Booker:"
# puts booking.user.email # dam2@dln.name

# puts "review:"
# puts review.user.email
# puts review.booking.id
