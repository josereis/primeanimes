FactoryBot.define do
  factory :season, class: Season do
    number { Faker::Number.between(from: 1, to: 10) }
    description { Faker::Lorem.paragraph }
    release_date { Faker::Date.between(from: (Date.today - 1.month), to: (Date.today - 1.day)) }

    trait :with_finish_date do
      finish_date { Date.today }
    end
  end
end
