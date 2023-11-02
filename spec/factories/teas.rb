FactoryBot.define do
  factory :tea do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.between(from: 70, to: 100).to_s + '°C' }
    brew_time { Faker::Number.between(from: 1, to: 10).to_s + ' minutes' }
  end
end