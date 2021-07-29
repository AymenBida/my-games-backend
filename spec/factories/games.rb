FactoryBot.define do
  factory :game do
    title { Faker::Game.title }
    year { rand(1972..2021).to_s }
    cover { Faker::Internet.url }
  end
end
