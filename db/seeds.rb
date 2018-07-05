BookingReview.delete_all
Booking.delete_all
Boat.delete_all
User.delete_all


users = ["bora", "jakob", "alex"]
avatars = ["bora.jpg", "jakob.jpg", "alex.jpg"]


3.times do |i|
  user = User.create(email: "#{users[i]}@lewagon.com", password: "#{users[i]}@lewagon.com", password_confirmation: "#{users[i]}@lewagon.com")
  user.avatar = File.open(Rails.root.join("db", "avatars", avatars[i]))
  user.save

end



cities = ["Istanbul", "Milano", "Como", "Paris","Milano","Milano"]
photos = ["boat1.jpg", "boat2.jpg"]

8.times do |i|
  boat = Boat.create(title: "Boat #{i}", description: "dummy text ever since the 1500", user_id: User.all.pluck(:id).sample, city: cities.sample, person_capacity: rand(1..10), price: rand(50..1000), start_date: "2018-07-10", end_date: "2018-08-30")
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
