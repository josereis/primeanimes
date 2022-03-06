FactoryBot.define do
  factory :user, class: User do
    after(:create) { |user| user.confirm }
    after(:build) { |user| user.avatar.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'user', 'default_avatar.jpg')), filename: 'default_avatar.jpg', content_type: 'image/jpg') }
    
    name { Faker::Name.unique.name }
    email { Faker::Internet.email}
    password { Faker::Internet.password }
    status { 'active' }

    trait :admin do
      profile { 'admin' }
    end

    trait :user_inactive do
      status { 'inactive' }
    end
  end
end
