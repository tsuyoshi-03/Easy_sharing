class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :postal_code
      t.string :address

      t.timestamps
    end
  end
end
