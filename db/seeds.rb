BookingReview.delete_all
Booking.delete_all
Boat.delete_all
User.delete_all


user1 = User.create(email: "dam@dln.name", password: "dam@dln.name", password_confirmation: "dam@dln.name")
user2 = User.create(email: "dam2@dln.name", password: "dam2@dln.name", password_confirmation: "dam2@dln.name")

boat1 = Boat.create(title: "Boat 1", description: "d1", user_id: user1.id, city: "Istanbul", person_capacity: 4, price: 30)
boat2 = Boat.create(title: "Boat 2", description: "d2", user_id: user1.id, city: "Istanbul", person_capacity: 2, price: 50)
boat3 = Boat.create(title: "Boat 3", description: "d3", user_id: user1.id, city: "Istanbul", person_capacity: 5, price: 40)

boat4 = Boat.create(title: "Boat 4", description: "d4", user_id: user1.id, city: "Montreal", person_capacity: 5, price: 20)
boat5 = Boat.create(title: "Boat 5", description: "d5", user_id: user1.id, city: "Montreal", person_capacity: 5, price: 30)
boat6 = Boat.create(title: "Boat 6", description: "d6", user_id: user1.id, city: "Montreal", person_capacity: 6, price: 30)

puts user1.id
puts user2.id

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
