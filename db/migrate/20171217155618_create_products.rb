class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :image_6
      t.integer :price
      t.boolean :is_featured
      t.string :collection_date
      t.boolean :is_sold_out
      t.text :description

      t.timestamps
    end
  end
end
