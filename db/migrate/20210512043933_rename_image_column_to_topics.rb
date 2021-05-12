class RenameImageColumnToTopics < ActiveRecord::Migration[5.2]
  def change
    rename_column :topics, :image, :image1
  end
end
