BookingReview.delete_all
Booking.delete_all
Boat.delete_all
User.delete_all


user1 = User.create(email: "jakob@lewagon.com", password: "jakob@lewagon.com", password_confirmation: "jakob@lewagon.com")
user2 = User.create(email: "bora@lewagon.com", password: "bora@lewagon.com", password_confirmation: "bora@lewagon.com")
user3 = User.create(email: "alex@lewagon.com", password: "alex@lewagon.com", password_confirmation: "alex@lewagon.com")

boat1 = Boat.create(title: "Boat 1", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user1.id, city: "Istanbul", person_capacity: 4, price: 30, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")
boat2 = Boat.create(title: "Boat 2", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user1.id, city: "Istanbul", person_capacity: 2, price: 50, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")
boat3 = Boat.create(title: "Boat 3", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user1.id, city: "Istanbul", person_capacity: 5, price: 40, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")
boat4 = Boat.create(title: "Boat 4", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user2.id, city: "Montreal", person_capacity: 5, price: 20, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")
boat5 = Boat.create(title: "Boat 5", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user2.id, city: "Montreal", person_capacity: 5, price: 30, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")
boat6 = Boat.create(title: "Boat 6", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", user_id: user2.id, city: "Montreal", person_capacity: 6, price: 30, photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png")


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
