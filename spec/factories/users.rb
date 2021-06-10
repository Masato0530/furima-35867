FactoryBot.define do
  factory :user do
    nickname { 'aaaaaa' }
    email { 'aaaaaa@sample.com' }
    password { 'nbr2nbr3' }
    password_confirmation { 'nbr2nbr3' }
    first_name { 'おおの' }
    last_name { 'まさと' }
    first_name_kana { 'オオノ ' }
    last_name_kana { 'マサト' }
    birthday { "2021-6-10" }
  end
end