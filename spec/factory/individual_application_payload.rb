FactoryBot.define do
  factory :individual_application_payload do
    ssn { Faker::Number.number(digits: 9) }
    full_name { build(:full_name) }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { build(:address) }
    email { Faker::Internet.email }
    phone { build(:phone) }
  end
end
