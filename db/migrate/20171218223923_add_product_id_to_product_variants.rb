class AddProductIdToProductVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :product_variants, :product_id, :integer
  end
end
