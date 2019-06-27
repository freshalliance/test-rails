class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :product, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.decimal :quantity, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
