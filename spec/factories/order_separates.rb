FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :order_separate do
    post_number     { Faker::Address.postcode }
    prefecture_id   { Faker::Number.between(1..47) }
    address_1       { Faker::Address.city }
    address_2       { Faker::Address.street_address }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    token           { 'tok_abcdefghijk13579246809753120' }
  end
end
