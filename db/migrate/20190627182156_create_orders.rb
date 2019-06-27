class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :client_type, null: false
      t.string :client_id, null: false
      t.datetime :delivery_at, null: false

      t.timestamps
    end
  end
end
