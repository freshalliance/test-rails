FactoryBot.define do
  factory :order_item do
    association :product, factory: :product
    association :order, factory: :order
    quantity { "9.99" }
  end
end
