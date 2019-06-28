class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :price, presence: true

  before_validation :freeze_price, unless: :price

  def freeze_price
    self.price = product.price
  end

  def total_sum
    price * quantity
  end
end
