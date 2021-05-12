class AddImage2ToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :image2, :string
  end
end
