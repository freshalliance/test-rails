products = 10.times.map do
  FactoryBot.create :product
end

10.times do
  o = FactoryBot.create :order

  10.times do
    FactoryBot.create :order_item, order: o, product: products.shuffle.first
  end
end

AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
