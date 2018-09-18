FactoryBot.define do

  factory :api_key do
    api_key { "0123456789ABCDEF" }
    user_id { nil }
  end

  factory :location do
    address { "46250" }
    latitude { 1.5 }
    longitude { 1.5 }
  end

  factory :user do
    name { "MyString" }
    uid { "MyString" }
    email { "MyString@example.com" }
    password { "blahblah" }
    image { "MyString" }
    oauth_token { "MyString" }
  end

  factory :plant do
    name { "test veg" }
    description { "oh so guud" }
    optimal_sun { "full" }
    optimal_soil { "loamy" }
    planting_considerations { "lots of things to consider" }
    when_to_plant { "spring" }
    growing_from_seed { "do it" }
    transplanting { "ok" }
    spacing { "10-12 inches apart" }
    watering { "lots" }
    other_care { "weed and stoof" }
    diseases { "yikes" }
    pests { "bugs fa dayz" }
    harvesting { "use ya hands" }
    storage_use { "fridge fa days" }
  end

end
