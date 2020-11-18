FactoryBot.define do
Faker::Config.locale = 'ja'
  factory :user do
    nickname                {Faker::Internet.username(specifier: 5..8)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation   {password}
    last_name               {Faker::Name.last_name}
    first_name              {Faker::Name.first_name}
    last_name_kana          {Faker::Games::Pokemon.name}
    first_name_kana         {Faker::Games::Pokemon.name}
    birthday                {Faker::Date.between_except(from: '1945-01-01', to: '2005-12-31', excepted: '1990-01-24')}
  end
end