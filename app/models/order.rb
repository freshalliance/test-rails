class Order < ApplicationRecord
  validates :delivery_at, presence: true
  validates :client_id, presence: true
  validates :client_type, presence: true

  has_many :order_items
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items

  def total_sum
    order_items.sum(&:total_sum)
  end
end
