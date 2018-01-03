class AddDeliveryAddressToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :delivery_first_name, :string
    add_column :orders, :delivery_last_name, :string
    add_column :orders, :delivery_country, :string
    add_column :orders, :delivery_address_1, :string
    add_column :orders, :delivery_address_2, :string
    add_column :orders, :delivery_city, :string
    add_column :orders, :delivery_postal_code, :string
  end
end
