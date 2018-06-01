class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :price
      t.string :time
      t.string :venue
      t.string :more_information

      t.timestamps
    end
  end
end
