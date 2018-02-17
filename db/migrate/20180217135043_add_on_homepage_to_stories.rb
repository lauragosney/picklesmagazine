class AddOnHomepageToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :on_homepage, :boolean, default: false
  end
end
