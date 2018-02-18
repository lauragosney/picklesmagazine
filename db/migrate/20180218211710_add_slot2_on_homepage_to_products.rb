class AddSlot2OnHomepageToProducts < ActiveRecord::Migration[5.1]
    def change
      add_column :products, :on_homepage_slottwo, :boolean, default: false
    end
end
