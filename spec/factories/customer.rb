FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end