class AddQuoteToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :quote, :string
  end
end
