class AddColumnsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :image3, :string
    add_column :topics, :image4, :string
  end
end
