class AddDefaultToProducts < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:products, :is_featured, false)
    change_column_default(:products, :is_sold_out, false)

  end
end
