FactoryBot.define do
  factory :history_buy do
    post_code { '123-4567' }
    shipping_area_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    association :user
    association :item
    token { 'whook_60662930281dc5696f97c6cc75' }
  end
end
