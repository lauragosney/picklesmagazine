class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :byline
      t.text :body
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :caption_1
      t.string :caption_2
      t.string :caption_3
      t.string :caption_4
      t.string :caption_5
      t.string :credit
      t.boolean :is_featured, default: false
      t.text :standfirst

      t.timestamps
    end
  end
end
