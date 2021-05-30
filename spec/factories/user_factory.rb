FactoryBot.define do
  factory :user do
    full_name { 'Carlos manzano' }
    email { 'email@example.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end