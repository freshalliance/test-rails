ActiveAdmin.register Order do
  permit_params :delivery_at, :client_id, :client_type, order_items_attributes: [:product_id, :quantity, :price]

  includes :order_items

  index do
    id_column

    column :created_at
    column :delivery_at
    column :client_id
    column :client_type

    column :item_count do |o|
      o.order_items.count
    end

    column :total_sum do |o|
      number_to_currency o.total_sum
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :client_id
      f.input :client_type
      f.input :delivery_at

      f.has_many :order_items, allow_destroy: true do |i|
        i.input :product
        i.input :quantity
        i.input :price
      end
    end

    f.actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :delivery_at
          row :client_id
          row :client_type
        end
      end

      column do
        panel 'Items' do
          table_for resource.order_items do
            column :product
            column :quantity

            column :price do |o|
              number_to_currency o.price
            end

            column :total_sum do |o|
              number_to_currency o.total_sum
            end
          end
        end
      end
    end
  end
end
