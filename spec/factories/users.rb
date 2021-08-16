FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { 'username@domain.com' }
    password { '123456' }
  end
end
