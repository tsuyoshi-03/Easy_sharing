class RenameShopColumnToTopics < ActiveRecord::Migration[5.2]
  def change
    rename_column :topics, :shop, :shop_id
  end
end
