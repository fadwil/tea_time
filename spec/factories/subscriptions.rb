FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.word }
    price { Faker::Commerce.price(range: 10..100) }
    status { %w[active inactive].sample }
    frequency { %w[daily weekly monthly].sample }
    tea
    customer
  end
end