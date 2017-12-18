class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.string :size
      t.string :color
      t.boolean :is_sold_out
      t.integer :rank

      t.timestamps
    end
  end
end
