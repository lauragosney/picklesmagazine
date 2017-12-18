class AddDefaultToProductVariants < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:product_variants, :is_sold_out, false)
  end
end
