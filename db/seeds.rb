BookingReview.delete_all
Booking.delete_all
Boat.delete_all
User.delete_all


user1 = User.create(email: "jakob@lewagon.com", password: "jakob@lewagon.com", password_confirmation: "jakob@lewagon.com")
user2 = User.create(email: "bora@lewagon.com", password: "bora@lewagon.com", password_confirmation: "bora@lewagon.com")
user3 = User.create(email: "alex@lewagon.com", password: "alex@lewagon.com", password_confirmation: "alex@lewagon.com")
user4 = User.create(email: "robert@lewagon.com", password: "robert@lewagon.com", password_confirmation: "robert@lewagon.com")

boat1 = Boat.create(title: "Delphin",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user1.id,
                    city: "Istanbul",
                    person_capacity: 4,
                    price: 30,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 41.0082 ,
                    longitude: 28.9784)
boat2 = Boat.create(title: "Poseidon",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user1.id,
                    city: "Istanbul",
                    person_capacity: 4,
                    price: 45,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 41.0082 ,
                    longitude: 28.9784)

boat3 = Boat.create(title: "Lion",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user2.id,
                    city: "Istanbul",
                    person_capacity: 10,
                    price: 100,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 41.0082 ,
                    longitude: 28.9784)

boat4 = Boat.create(title: "Rose",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user2.id,
                    city: "Istanbul",
                    person_capacity: 4,
                    price: 90,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 41.0082 ,
                    longitude: 28.9784)

boat5 = Boat.create(title: "Beer",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user3.id,
                    city: "Como",
                    person_capacity: 4,
                    price: 30,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 45.8081 ,
                    longitude: 9.0852)

boat6 = Boat.create(title: "Wine",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    user_id: user4.id,
                    city: "Como",
                    person_capacity: 4,
                    price: 30,
                    photo: "image/upload/v1530700826/rasc5gsvrkg34ntnv00q.png",
                    latitude: 45.8081 ,
                    longitude: 9.0852)

booking1 =  Booking.create(user_id: user1.id,
                            boat_id: boat6.id,
                            start_date: "02/04/2017",
                            end_date: "14/04/2017")

booking2 =  Booking.create(user_id: user2.id,
                            boat_id: boat5.id,
                            start_date: "2/4/2017",
                            end_date: "14/4/2017")

booking3 =  Booking.create(user_id: user3.id,
                            boat_id: boat1.id,
                            start_date: "14/4/2017",
                            end_date: "14/4/2017")




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
