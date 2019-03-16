# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { Faker::Nation.unique.capital_city }
    description { Faker::Lorem.unique.sentence }
    longitude { Faker::Number.unique.decimat(2) }
    latitude { Faker::Number.unique.decimat(2) }
  end
end
