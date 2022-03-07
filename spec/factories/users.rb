FactoryBot.define do
  factory :user, class: User do
    after(:create) { |user| user.confirm }
    
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
