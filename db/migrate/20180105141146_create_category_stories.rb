class CreateCategoryStories < ActiveRecord::Migration[5.1]
  def change
    create_table :category_stories do |t|
      t.belongs_to :story, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.boolean :is_featured, default: false

      t.timestamps
    end
  end
end
