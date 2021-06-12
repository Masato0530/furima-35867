FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials}
    email                  {Faker::Internet.free_email}
    password               { 'nbr2nbr3' }
    password_confirmation  { 'nbr2nbr3' }
    first_name             { "ぜんかく" }
    last_name              { "ぜんかく" }
    first_name_kana        { "ゼンカクカナ" }
    last_name_kana         { "ゼンカクカナ" }
    birthday               { "2021-6-10" }
  end
end