FactoryBot.define do
  factory :episode do
    number { Faker::Number.between(from: 1, to: 10) }
    title { Faker::Lorem.sentence }
  end
end
