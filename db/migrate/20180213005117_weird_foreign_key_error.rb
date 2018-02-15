class WeirdForeignKeyError < ActiveRecord::Migration[5.1]
  def change
    # add_foreign_key :products, :product_variants, on_delete: :cascade
    # add_foreign_key :product_variants, :products, on_delete: :cascade
    # add_index :product_variants, :product_id
  end
end
