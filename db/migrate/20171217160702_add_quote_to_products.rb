class AddQuoteToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :quote, :string
  end
end
