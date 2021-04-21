class AddShopToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :shop, :string
  end
end
