# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Boat.destroy_all
Booking.destroy_all
User.destroy_all

greg =  User.new({
  first_name: "Grégoire",
  last_name: "Courtois",
  email: "courtoisgregoire@gmail.com",
  rating: 3.4,
  password: 'topsecret',
  password_confirmation: 'topsecret'
})
greg.remote_photo_url = "https://avatars2.githubusercontent.com/u/27558438"
greg.save


alki = User.new({
  first_name: "Alki",
  last_name: "Delichatsios",
  email: "alkidel@gmail.com",
  rating: 4.2,
  password: 'topsecret',
  password_confirmation: 'topsecret'
})
alki.remote_photo_url = "https://avatars3.githubusercontent.com/u/6272607"
alki.save

pierre = User.new({
  first_name: "Pierre",
  last_name: "Lestang",
  email: "plestang@gmail.com",
  rating: 5,
  password: 'topsecret',
  password_confirmation: 'topsecret'
})
pierre.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/tmuwtd66xwga6yfafgpy.jpg"
pierre.save

mathieu = User.new({
  first_name: "Mathieu",
  last_name: "Deltort",
  email: "mathieu.deltort@gmail.com",
  rating: 4.4,
  password: 'topsecret',
  password_confirmation: 'topsecret'
})
mathieu.remote_photo_url = "https://avatars2.githubusercontent.com/u/45971412"
mathieu.save


puts "Created #{User.count} users"


BOATS_CATEGORY = ["Sailboat","Motorboat","Catamaran","RIB","Houseboat"]
USERS = [greg, mathieu, alki, pierre]
PHOTOS = %w(pexels-photo-533595 pexels-photo-531474 pexels-photo-570987 pexels-photo-296278 pexels-photo-382167 pexels-photo-296242 pexels-photo-275637 pexels-photo-351774 pexels-photo-273886 pexels-photo-244517 pexels-photo-218999 pexels-photo-1655166 ship-boat-lake-garda-italy pexels-photo-209978 pexels-photo-127160 sailing-ship-vessel-boat-sea-37859 pexels-photo-1586795 sunrise-phu-quoc-island-ocean pexels-photo-1295036 luxury-yacht-boat-speed-water-163236 light-sunset-water-boat pexels-photo-675764 pexels-photo-1555313 pexels-photo-1007836)

  # resource_type = "image"
  # type = "upload"
  # version = 1234567890
  # public_id = "g6u3tb5embqi6jvigxph"
  # format = "jpg"
  # signature = Cloudinary::Utils.api_sign_request({:public_id=>public_id,
  # :version=>version}, Cloudinary.config.api_secret)

# PHOTO = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}## .
#   {signature}"

PHOTOS.each do |image|
  url = "https://res.cloudinary.com/dsiephejy/image/upload/v1550594036/#{image}.jpg"
  boat = Boat.new({
    price_per_day: rand(80...500),
    description: "Some description",
    category: BOATS_CATEGORY.sample,
    user_id: USERS.sample.id
  })
  boat.remote_photo_url = url
  boat.save
end

puts "Created #{Boat.count} boats"

