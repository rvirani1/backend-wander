# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = [{ name: "accounting"}, { name: "airport"}, { name: "amusement_park"}, { name: "aquarium"}, { name: "art_gallery"}, { name: "atm"}, { name: "bakery"},
  { name: "bank"}, { name: "bar"}, { name: "beauty_salon"}, { name: "bicycle_store"}, { name: "book_store"}, { name: "bowling_alley"}, { name: "bus_station"},
  { name: "cafe"}, { name: "campground"}, { name: "car_dealer"}, { name: "car_rental"}, { name: "car_repair"}, { name: "car_wash"}, { name: "casino"},
  { name: "cemetery"},
  { name: "church"}, { name: "city_hall"}, { name: "clothing_store"}, { name: "convenience_store"}, { name: "courthouse"}, { name: "dentist"},
   { name: "department_store"}, { name: "doctor"},
  { name: "electrician"}, { name: "electronics_store"}, { name: "embassy"}, { name: "establishment"}, { name: "finance"}, { name: "fire_station"},
  { name: "florist"}, { name: "food"}, { name: "funeral_home"},
  { name: "furniture_store"}, { name: "gas_station"}, { name: "general_contractor"}, { name: "grocery_or_supermarket"}, { name: "gym"},
   { name: "hair_care"}, { name: "hardware_store"}, { name: "health"},
  { name: "hindu_temple"}, { name: "home_goods_store"}, { name: "hospital"}, { name: "insurance_agency"}, { name: "jewelry_store"}, { name: "laundry"},
   { name: "lawyer"}, { name: "library"}, { name: "liquor_store"},
  { name: "local_government_office"}, { name: "locksmith"}, { name: "lodging"}, { name: "meal_delivery"}, { name: "meal_takeaway"}, { name: "mosque"},
  { name: "movie_rental"}, { name: "movie_theater"}, { name: "moving_company"},
  { name: "museum"}, { name: "night_club"}, { name: "painter"}, { name: "park"}, { name: "parking"}, { name: "pet_store"}, { name: "pharmacy"},
  { name: "physiotherapist"}, { name: "place_of_worship"}, { name: "plumber"}, { name: "police"}, { name: "post_office"}, { name: "real_estate_agency"},
   { name: "restaurant"}, { name: "roofing_contractor"}, { name: "rv_park"}, { name: "school"}, { name: "shoe_store"}, { name: "shopping_mall"}, { name: "spa"},
   { name: "stadium"}, { name: "storage"}, { name: "store"}, { name: "subway_station"}, { name: "synagogue"}, { name: "taxi_stand"}, { name: "train_station"},
   { name: "transit_station"}, { name: "travel_agency"}, { name: "university"}, { name: "veterinary_care"}, { name: "zoo"}, {name: "point_of_interest"}]

Type.create(types)

# { name: "bar"}, { name: "cafe"} { name: "food" MAP RESTAURANT} { name: "lodging" HOTEL} { name: "night_club" MAP TO BAR } { name: "park"}
# { name: "restaurant" } { name: "place_of_worship" } { name: "spa" MAYBE MAP? } { name: "point_of_interest" && name: "establishment" => OTHER }
#
# [ { name: "zoo"}{ name: "amusement_park"}, { name: "aquarium"}, { name: "art_gallery"} { name: "museum"} => MAP THINGS_TO_DO]
