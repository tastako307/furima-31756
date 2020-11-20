FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :item do
    name            { Faker::Device.manufacturer }
    text            { Faker::Ancient.hero }
    price           { Faker::Number.within(range: 300..9_999_999) }
    category_id     { Faker::Number.within(range: 1..10) }
    condition_id    { Faker::Number.within(range: 1..6) }
    deadline_id     { Faker::Number.within(range: 1..3) }
    fee_id          { Faker::Number.within(range: 1..2) }
    prefecture_id   { Faker::Number.within(range: 1..47) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
