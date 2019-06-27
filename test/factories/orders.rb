FactoryBot.define do
  factory :order do
    client_type { "basic" }
    client_id { "1" }
    delivery_at { Faker::Date.between(2.days.ago, 2.days.from_now) }
  end
end
