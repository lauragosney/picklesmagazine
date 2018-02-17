class AddOnHomepageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :on_homepage, :boolean, default: false
  end
end
