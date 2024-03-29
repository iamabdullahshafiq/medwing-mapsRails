# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    title { Faker::Nation.unique.capital_city }
    description { Faker::Lorem.unique.sentence }
    longitude { Faker::Number.unique.decimal(2) }
    latitude { Faker::Number.unique.decimal(2) }
  end
end
