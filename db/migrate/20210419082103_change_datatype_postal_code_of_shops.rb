class ChangeDatatypePostalCodeOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :postal_code, :string
  end
end
