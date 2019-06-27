ActiveAdmin.register Order do
  permit_params :delivery_at, :client_id, :client_type

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
