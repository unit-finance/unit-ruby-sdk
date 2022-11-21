FactoryBot.define do
  factory :phone do
    country_code { Faker::PhoneNumber.country_code }
    number { Faker::PhoneNumber.phone_number }
  end
end
