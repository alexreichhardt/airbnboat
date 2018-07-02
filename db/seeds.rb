Booking.delete_all
Boat.delete_all
User.delete_all

user1 = User.create(email: "dam@dln.name", password: "dam@dln.name", password_confirmation: "dam@dln.name")
user2 = User.create(email: "dam2@dln.name", password: "dam2@dln.name", password_confirmation: "dam2@dln.name")
boat = Boat.create(title: "Boat 1", description: "long description", user_id: user1.id)

puts user1.id
puts user2.id
puts boat.id

booking = Booking.create(user_id: user2.id, boat_id: boat.id)

puts "booking.id:"
puts booking.id

puts "Owner:"
puts booking.owner_user.email # dam@dln.name

puts "Booker:"
puts booking.user.email # dam2@dln.name
