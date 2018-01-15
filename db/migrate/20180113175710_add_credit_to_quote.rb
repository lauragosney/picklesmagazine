class AddCreditToQuote < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :quote_credit, :string
  end
end
