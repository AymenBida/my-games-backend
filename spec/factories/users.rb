FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { 'username@domain.com' }
    password_digest { '123456' }
  end
end
