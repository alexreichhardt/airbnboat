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



cities = ["Milano"]
photos = ["boat1.jpg", "boat2.jpg"]

8.times do |i|
  boat = Boat.create(title: "Boat #{i}", description: "dummy text ever since the 1500", user_id: User.all.pluck(:id).sample, city: cities.sample, person_capacity: rand(1..10), price: rand(50..1000), start_date: "2018-07-10", end_date: "2018-08-30")
  boat.photo = File.open(Rails.root.join("db", "seeds", photos.sample))
  boat.save
end

10.times do
  booking = Booking.create(user_id: User.all.pluck(:id).sample, boat_id: Boat.all.pluck(:id).sample, start_date: "2018-07-27", end_date: "2018-08-29", price: rand(500..10000))
  booking.save
end

user_ids = []
Booking.all.each do |booking|
  user_ids << booking.user_id
end
15.times do
  review = BookingReview.create(title: "nice cruise", content: "dummy text ever since the 1500 dummy text ever since the 1500 dummy text ever since the 1500", rating: rand(1..5), user_id:  user_ids.sample, booking_id:  Booking.all.pluck(:id).sample)
  review.save
end
