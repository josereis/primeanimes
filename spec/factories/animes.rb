FactoryBot.define do
  factory :anime, class: Anime do
    after(:build) do |anime|
      anime.photo.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'anime', 'default_photo.jpg')), filename: 'default_couver.jpg', content_type: 'image/jpg')
    end

    title { Faker::Name.unique.name }
    status { 'in_progress' }
    synopsis { Faker::Lorem.paragraph }
    release_date { Faker::Date.between(from: (Date.today - 1.year), to: (Date.today - 1.day)) }

    trait :with_finish_date do
      finish_date { Date.today }
    end

    trait :removed do
      removed { true }
    end
  end
end
