FactoryBot.define do
  factory :admin, class: Admin do
    name { 'Admin' }
    email { 'admin@admin.com.br' }
    password { '12345678' }
  end
end
