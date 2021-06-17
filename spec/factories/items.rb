FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
     products_status_id { Faker::Number.between(from: 2, to: 7) }
     shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
     shipping_area_id { Faker::Number.between(from: 1, to: 47) }
     condition_id { Faker::Number.between(from: 2, to: 4) }
     association :user
    
     after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
